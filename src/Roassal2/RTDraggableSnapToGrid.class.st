"
I am an interaction which allows the element to be dragged in a steps of fixed size equivalent to the size of the grid.

Here is an example:
-=-=-=
v := RTView new.

s := RTBox new size: 20; color: (Color blue alpha: 0.3).
es := s elementsOn: (1 to: 10).
v addAll: es.
RTGridLayout on: es.

es @ RTDraggableSnapToGrid.

v
-=-=-=


When embedded within the RTInteractionBuilder (and thus by Mondrian):
-=-=-=
b := RTMondrian new.

b interaction snapToGrid.
b shape rectangle size: 20. 
b nodes: (1 to: 9).
b layout grid.
b
-=-=-=
"
Class {
	#name : #RTDraggableSnapToGrid,
	#superclass : #RTAbstractDraggable,
	#instVars : [
		'gridSize'
	],
	#category : #'Roassal2-Core'
}

{ #category : #initialization }
RTDraggableSnapToGrid >> defaultGridSize [
	^ 10
]

{ #category : #accessing }
RTDraggableSnapToGrid >> gridSize [
	^ gridSize
]

{ #category : #accessing }
RTDraggableSnapToGrid >> gridSize: anInteger [
	"Default value is given by defaultGridSize. Could be 10 for example"
	gridSize := anInteger
]

{ #category : #initialization }
RTDraggableSnapToGrid >> initialize [
	super initialize.
	gridSize := self defaultGridSize
]

{ #category : #hooks }
RTDraggableSnapToGrid >> initializeElement: element [
	| totalD |
	totalD := 0 @ 0.
	element when: TRMouseDragStart do: [ :event | totalD := 0 @ 0 ].
	element
		when: TRMouseDragging
		do: [ :event | 
			| d t |
			t := RTGroup withAll: groupToDrag.
			(t includes: element)
				ifFalse: [ t add: element ].
			d := element view canvas camera distanceFromPixelToSpace: event step.
			totalD := totalD + d.
			d := gridSize * ((totalD x / gridSize) rounded @ (totalD y / gridSize) rounded).
			totalD := totalD - d.
			t translateBy: d.
			event signalUpdate ]
]