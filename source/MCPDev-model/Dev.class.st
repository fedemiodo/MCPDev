Class {
	#name : #Dev,
	#superclass : #Object,
	#instVars : [
		'seniority',
		'production'
	],
	#category : #'MCPDev-model'
}

{ #category : #'instance creation' }
Dev class >> baseProduction [

	^self subclassResponsibility
]

{ #category : #'instance creation' }
Dev class >> new [

	^self seniority: self typeDescription producing: self baseProduction
]

{ #category : #'instance creation' }
Dev class >> seniority: aSeniority producing: aNumber [

	^super new initializeWithSeniority: aSeniority producing: aNumber
]

{ #category : #'instance creation' }
Dev class >> typeDescription [

	^self subclassResponsibility 
]

{ #category : #initialization }
Dev >> initializeWithSeniority: aSeniority producing: aNumber [

	seniority := aSeniority.
	production := aNumber
]

{ #category : #accessing }
Dev >> production [

	^production
]

{ #category : #accessing }
Dev >> seniority [

	^seniority
]
