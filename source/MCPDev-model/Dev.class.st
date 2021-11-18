Class {
	#name : #Dev,
	#superclass : #Object,
	#instVars : [
		'seniority',
		'productionPerTick'
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
	productionPerTick := DevCoin amount: aNumber
]

{ #category : #producing }
Dev >> produce: aDevCoin [

	^aDevCoin + self productionPerTick
]

{ #category : #accessing }
Dev >> productionPerTick [

	^ productionPerTick
]

{ #category : #accessing }
Dev >> seniority [

	^seniority
]
