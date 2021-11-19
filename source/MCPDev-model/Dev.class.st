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
Dev class >> producing: aCurrency [

	^ self seniority: self typeDescription producing: aCurrency
]

{ #category : #'instance creation' }
Dev class >> seniority: aSeniority producing: aCurrency [

	^ super new initializeWithSeniority: aSeniority producing: aCurrency
]

{ #category : #'instance creation' }
Dev class >> typeDescription [

	^self subclassResponsibility 
]

{ #category : #initialization }
Dev >> baseProduction [

	^ self class baseProduction
]

{ #category : #initialization }
Dev >> initializeWithSeniority: aSeniority producing: aCurrency [

	seniority := aSeniority.
	productionPerTick := Measure amount: self baseProduction unit: aCurrency
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
