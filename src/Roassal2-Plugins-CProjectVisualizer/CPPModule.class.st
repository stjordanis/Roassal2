Class {
	#name : #CPPModule,
	#superclass : #CPPFile,
	#instVars : [
		'header',
		'dependentModules'
	],
	#category : #'Roassal2-Plugins-CProjectVisualizer'
}

{ #category : #accessing }
CPPModule >> dependOn: aRegExp [
	^ self dependentModules anySatisfy: [ :m | aRegExp match: m filename ]
]

{ #category : #accessing }
CPPModule >> dependentModules [
	^ dependentModules
]

{ #category : #testing }
CPPModule >> hasHeader [
	^ header notNil
]

{ #category : #accessing }
CPPModule >> header [
	^ header
]

{ #category : #accessing }
CPPModule >> header: anObject [
	header := anObject
]

{ #category : #initialization }
CPPModule >> initialize [
	super initialize.
	dependentModules := OrderedCollection new
]