"
I am a class to produces treemap visualizations

see examples to  know how to use me.

check this to get more info:
http://www.humane-assessment.com/blog/system-nesting-map
"
Class {
	#name : #RTTreeMapBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'extent',
		'nodes',
		'edges',
		'elements',
		'rtEdges',
		'weight',
		'rootElements',
		'rectangle',
		'inset',
		'popup'
	],
	#category : #'Roassal2-Builder-TreeMap'
}

{ #category : #building }
RTTreeMapBuilder >> buildEdges [
	| fromNode toNode children |
	self rtEdges do: [ :ed |
		fromNode := self elements select: [ :each | each model = ed key]. 
		toNode := self elements select: [ :each | each model = ed value ].
		((fromNode size = 1) and: [ toNode size = 1 ]) ifTrue: [ 
			fromNode := fromNode first.
			toNode := toNode first.
			children := fromNode attributes at: #elements ifAbsentPut: [ OrderedCollection new ].
			children add: toNode.
			toNode attributes at: #parent put: fromNode ]
		 ].
	self computeRootElements.
	
	
]

{ #category : #building }
RTTreeMapBuilder >> buildElements [
	shapeBuilder borderColor: Color black.
	nodes do: [ :n |
		self elements add: ((shapeBuilder elementOn: n)@RTDraggable @ popup). ]
]

{ #category : #building }
RTTreeMapBuilder >> computeRootElements [
	
	self rootElements: (self elements select: [ :e | (e attributes includesKey: #parent) not ]).
]

{ #category : #building }
RTTreeMapBuilder >> createNodes: atree using: ablock [
	| children |
	self nodes add: atree.
	
	children := ablock rtValue: atree.
	
	children do: [ :child | 
		self createNodes: child using: ablock.
		self rtEdges add: (atree -> child). ].
	
]

{ #category : #hooks }
RTTreeMapBuilder >> createView [
	^ super createView @ RTDraggableView.
]

{ #category : #'default-values' }
RTTreeMapBuilder >> defaultExtent [
	^ 500@500.
]

{ #category : #'default-values' }
RTTreeMapBuilder >> defaultInset [
	^ 4
]

{ #category : #accesing }
RTTreeMapBuilder >> edges [
	^ edges.
]

{ #category : #accesing }
RTTreeMapBuilder >> edges: anObject [
	edges := anObject.
]

{ #category : #accesing }
RTTreeMapBuilder >> edgesFrom: fromBlock toAll: toBlock [
	| from to |
	self nodes do: [ :m | 
		from := fromBlock rtValue: m.
		to := toBlock rtValue: m.
		from isCollection ifFalse: [ from := Array with: from. ].
		to isCollection ifFalse: [ to := Array with: to. ].
		from do: [ :f |	to do: [ :t | self rtEdges add: f -> t ] ] ].
]

{ #category : #accesing }
RTTreeMapBuilder >> edgesFromAssociations: anObject [
	| interestingEdges |
	
	edges := anObject.
	
	interestingEdges := self edges select: [ :assoc |
		(((assoc key notNil and: [ assoc value notNil ])
			and: [ (assoc key ~~ assoc value) and: [ assoc key ~= assoc value ] ])
			and: [ self nodes includes: assoc key ] )and: [ self nodes includes: assoc value ] ].
	interestingEdges := interestingEdges asOrderedCollection removeDuplicates.
	
	interestingEdges do: [ :edge |
		self rtEdges add: edge. ].
	
	
]

{ #category : #accesing }
RTTreeMapBuilder >> elements [
	^ elements ifNil: [ elements := OrderedCollection new ]
]

{ #category : #building }
RTTreeMapBuilder >> explore: atree using: ablock [
	self nodes: OrderedCollection new.
	self createNodes: atree using: ablock.
	
]

{ #category : #accesing }
RTTreeMapBuilder >> extent [
	^ extent ifNil: [ extent := self defaultExtent ].
]

{ #category : #accesing }
RTTreeMapBuilder >> extent: anObject [
	extent := anObject.
	
]

{ #category : #'layout-utils' }
RTTreeMapBuilder >> getRemainingSpace [
	^ self rectangle shortestSide
]

{ #category : #layout }
RTTreeMapBuilder >> highestAspectRatioFor: row remainingSpace: remainingSpace [
	| sum areas minArea maxArea |
	areas := row collect: [ :e | e attributes at: #area ].
	sum := areas sum.
	maxArea := areas max.
	minArea := areas min.
	((remainingSpace <=0) or: [minArea <= 0])
		ifTrue: [ ^ SmallInteger maxVal ]
		ifFalse: [ ^ ((((remainingSpace * remainingSpace) * maxArea) / (sum * sum))  max: ((sum * sum) / (minArea * (remainingSpace * remainingSpace)))) ]
]

{ #category : #initialization }
RTTreeMapBuilder >> initialize [
	super initialize.
	shapeBuilder rectangle.
	popup := RTPopup new.
]

{ #category : #accesing }
RTTreeMapBuilder >> inset [
	^ inset ifNil: [ inset := self defaultInset ].
]

{ #category : #accesing }
RTTreeMapBuilder >> inset: anObject [
	inset := anObject
]

{ #category : #'layout-utils' }
RTTreeMapBuilder >> layoutChildrenOfRow: row [
	| oldCanvas|
	oldCanvas := self rectangle veryDeepCopy.
	row do: [ :each | | children |
		children := each attributes at: #elements ifAbsent: [ #() ].
		self 
			squarify: children 
			inRectangle: (RTRectangleTreeMap fromContainerBounds: (each position extent: each extent) withInset: self inset) ].
	
	self rectangle: oldCanvas.
]

{ #category : #layout }
RTTreeMapBuilder >> layoutElements [
	
	self squarify: self rootElements 
		inRectangle: (RTRectangleTreeMap origin: 0@0 extent: self extent).

	
]

{ #category : #'layout-utils' }
RTTreeMapBuilder >> layoutHorizontalRow: row [ 

	| container totalWidth areaToLayout height |
	container := self rectangle currentSubrectangle.
	totalWidth := container width.	
	areaToLayout := row inject: 0 into: [ :s :e | s + (e attributes at: #area) ].
	height := areaToLayout / totalWidth.
	row do: [ :each | each extent: (((each attributes at: #area) / height) @ height) ].	
	self translateElementsHorizontally: row in: container.
]

{ #category : #layout }
RTTreeMapBuilder >> layoutRow: row [
	| container |
	container := rectangle currentSubrectangle.
	(container width >= container height)
		ifTrue: [ self layoutVerticalRow: row ]
		ifFalse: [ self layoutHorizontalRow: row ].
	self layoutChildrenOfRow: row.
	self prepareNextRectangleAfterRow: row.
]

{ #category : #'layout-utils' }
RTTreeMapBuilder >> layoutVerticalRow: row [
	| container totalHeight areaToLayout width |
	container := rectangle currentSubrectangle.
	totalHeight := container height.
	areaToLayout := row inject: 0 into: [ :s :e | s+ (e attributes at: #area) ].
	width := areaToLayout /totalHeight.
	row do: [ :each | each extent: (width @ ( (each attributes at: #area) / width)) ].
	self translateElementsVertically: row in: container.
]

{ #category : #accesing }
RTTreeMapBuilder >> nodes [
	^ nodes
]

{ #category : #accesing }
RTTreeMapBuilder >> nodes: anObject [
	nodes := anObject.
	
]

{ #category : #accesing }
RTTreeMapBuilder >> popup [
	^ popup
]

{ #category : #'layout-utils' }
RTTreeMapBuilder >> prepareElementsForLayout: elms inRectangle: rec [
	| elementsArea viewArea area |
	elms isEmpty ifTrue: [ ^ elms ].
	elementsArea := elms inject: 0 into: [ :s :e | 
		s + (weight rtValue: e model) ].
	elementsArea isZero ifTrue: [ self error: 'Invalid weight block' ].
	
	viewArea := rec width * rec height.
	area := [ :m | (viewArea * (self weight rtValue: m))/elementsArea ].
	elms do: [ :e|
		area := ((viewArea * (weight rtValue: e model))/elementsArea) asFloat.
		e attributes at: #area put: area. ].
	
	^ elms
]

{ #category : #'layout-utils' }
RTTreeMapBuilder >> prepareNextRectangleAfterRow: row [
	| nextRect |
	nextRect := self rectangle currentSubrectangle computeRemainingSubrectangleFrom: row.
	self rectangle addSubrectangle: nextRect
]

{ #category : #accesing }
RTTreeMapBuilder >> rectangle [
	^ rectangle.
]

{ #category : #accesing }
RTTreeMapBuilder >> rectangle: anObject [
	rectangle := anObject
]

{ #category : #hooks }
RTTreeMapBuilder >> renderIn: aView [
	
	self buildElements.
	self buildEdges.
	aView addAll: self elements.
	self layoutElements.
	
	
]

{ #category : #accesing }
RTTreeMapBuilder >> rootElements [
	^ rootElements
]

{ #category : #accesing }
RTTreeMapBuilder >> rootElements: anObject [
	rootElements := anObject
]

{ #category : #accesing }
RTTreeMapBuilder >> rtEdges [
	^ rtEdges ifNil: [ rtEdges := OrderedCollection new ]
]

{ #category : #layout }
RTTreeMapBuilder >> squarify: children currentRow: row remainingSpace: remainingSpace [
	| firstElement remainingChildren |
	firstElement := children first.
	(row isEmpty or: [
		| oldRatio newElementRatio |
		oldRatio := self highestAspectRatioFor: row remainingSpace: remainingSpace.
		newElementRatio := self highestAspectRatioFor: (row, (Array with: firstElement)) remainingSpace: remainingSpace.
		oldRatio >= newElementRatio ] ) 
	ifTrue: [ 
		remainingChildren := children allButFirst.
		(remainingChildren isEmpty) ifTrue: [ self layoutRow: (row, (Array with: firstElement)) ]
		ifFalse: [ 
			self 
				squarify: remainingChildren
				currentRow: (row, (Array with: firstElement) )
				remainingSpace: remainingSpace ]
	 ] ifFalse: [ 
		self layoutRow: row.
		self 
			squarify: children
			currentRow: (OrderedCollection new)
			remainingSpace: self getRemainingSpace.
	 ].
	firstElement pushBack
]

{ #category : #layout }
RTTreeMapBuilder >> squarify: children inRectangle: aTreeRectangle [

	| elementsToLayout |
	children isEmpty ifTrue: [ ^ self  ].
	self rectangle: aTreeRectangle.
	elementsToLayout := self prepareElementsForLayout: children inRectangle: aTreeRectangle.
	self 
		squarify: elementsToLayout
		currentRow: OrderedCollection new
		remainingSpace: (aTreeRectangle width min: aTreeRectangle height).
]

{ #category : #'layout-utils' }
RTTreeMapBuilder >> translateElementsHorizontally: row in: container [

	| currentPoint |
	currentPoint := container origin.
	row do: [ :each |
		each translateTo: currentPoint + (each extent / 2).
		currentPoint := currentPoint translateBy: ((each width) @ 0 ).
	].
]

{ #category : #'layout-utils' }
RTTreeMapBuilder >> translateElementsVertically: row in: container [
	| currentPoint |
	currentPoint := container origin.
	row do: [ :each | 
		each translateBy: currentPoint+(each extent/2).
		currentPoint := currentPoint translateBy: (0@(each height))]
]

{ #category : #accesing }
RTTreeMapBuilder >> weight [
	^ weight
]

{ #category : #accesing }
RTTreeMapBuilder >> weight: anObject [
	weight := anObject
]