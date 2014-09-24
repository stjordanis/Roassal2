"
A RTDoubleBarBuilder render a double bar chart
"
Class {
	#name : #RTDoubleBarBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'elements',
		'topExtremity',
		'bottomExtremity',
		'pointName',
		'verticalGap',
		'width'
	],
	#category : #'Roassal2-Builder-Charter'
}

{ #category : #configuration }
RTDoubleBarBuilder >> bottomValue: aBlock [
	"The gray bar"
	self bottomValue: aBlock titled: aBlock asString
]

{ #category : #configuration }
RTDoubleBarBuilder >> bottomValue: aBlock titled: aTitle [
	"The gray bar"
	 | configuration |
	self metric: aBlock color: Color lightGray height: 20.
	
	configuration := RTAxisConfiguration new.
	configuration builder: self.
	configuration title: aTitle.
	configuration titlePosition: (0 @ -30).
	configuration color: Color lightGray.
	configuration minValue: 0.
	configuration positionLabel: [ :aLabel :aTick | aLabel translateTo: aTick position + (0 @ 15) ].
	configuration maxValue: (self points collect: aBlock) max.
	configuration numberOfTicks: 4.
	configuration axisFrom: bottomExtremity position to: bottomExtremity position + (width @ 0).
	
]

{ #category : #hooks }
RTDoubleBarBuilder >> createView [
	^ super createView @ RTDraggableView
]

{ #category : #configuration }
RTDoubleBarBuilder >> defaultVerticalGap [
	^ 5
]

{ #category : #configuration }
RTDoubleBarBuilder >> defaultWidth [
	^ 250
]

{ #category : #examples }
RTDoubleBarBuilder >> example01 [
	"
	self new example01
	"
	| b |
	b := RTDoubleBarBuilder new.
	b points: RTShape withAllSubclasses.
	b bottomValue: #numberOfMethods.
	b topValue: #numberOfVariables.
	b open maximize
]

{ #category : #initialization }
RTDoubleBarBuilder >> initialize [
	super initialize.
	pointName := #yourself.
	verticalGap := self defaultVerticalGap.
	width := self defaultWidth.
]

{ #category : #configuration }
RTDoubleBarBuilder >> metric: aBlock color: aColor height: anHeight [
	| boxes |
	boxes := elements collect: [ :el | 
		| b |
		b := (RTBox new height: anHeight; color: aColor) elementOn: el model.
		b @ (RTPopup text: [ :model | aBlock rtValue: model ]).
		b ].
	RTMetricNormalizer new 
		elements: boxes;
		normalizeWidth: aBlock min: 2 max: width minValue: 0.
 		
	elements with: boxes do: [ :e :b | 		 
		TRConstraint move: b onTheRightOf: e.
		b translateBy: 2 @ 0. ].
	view addAll: boxes.
]

{ #category : #configuration }
RTDoubleBarBuilder >> pointName: aOneArgBlock [
	pointName := aOneArgBlock
]

{ #category : #'public-accessing' }
RTDoubleBarBuilder >> points [
	^ elements collect: #model
]

{ #category : #'public-accessing' }
RTDoubleBarBuilder >> points: someObjects [
	elements := (RTLabel new text: pointName) elementsOn: someObjects.
	elements @ RTHighlightable.
	view addAll: elements.
	RTVerticalLineLayout new 
		verticalGap: verticalGap;
		alignRight; 
		on: elements.
	
	topExtremity := RTBox element.
	bottomExtremity := RTBox element.
	TRConstraint move: topExtremity onTheRightOf: elements first.
	TRConstraint move: bottomExtremity onTheRightOf: elements last.
	topExtremity translateBy: 0 @ -15.
	bottomExtremity translateBy: 0 @ 15.	
	view add: ((RTLine new color: Color red) edgeFrom: topExtremity to: bottomExtremity).
]

{ #category : #configuration }
RTDoubleBarBuilder >> topValue: aBlock [
	"The red bar"
	self topValue: aBlock titled: aBlock asString
]

{ #category : #configuration }
RTDoubleBarBuilder >> topValue: aBlock titled: aTitle [
	"The red bar"
	 | configuration |
	self metric: aBlock color: Color red height: 10.
	
	configuration := RTAxisConfiguration new.
	configuration builder: self.
	configuration title: aTitle.
	configuration titlePosition: (0 @ 30).
	configuration color: Color red.
	configuration minValue: 0.
	configuration positionLabel: [ :aLabel :aTick | aLabel translateTo: aTick position - (0 @ 15) ].
	configuration maxValue: (self points collect: aBlock) max.
	configuration numberOfTicks: 4.
	configuration axisFrom: topExtremity position to: topExtremity position + (width @ 0).
]