Class {
	#name : #Market,
	#superclass : #Object,
	#instVars : [
		'developers',
		'currency'
	],
	#category : #'MCPDev-model'
}

{ #category : #'instance creation' }
Market class >> new [

	^super new initializeMarket
]

{ #category : #'API -Events' }
Market >> addJuniorDeveloper [

	self developers add: (Junior producing: self devCoin)
]

{ #category : #'API -Events' }
Market >> addSemiSeniorDeveloper [

	self developers add: (SemiSenior producing: self devCoin)
]

{ #category : #'API -Events' }
Market >> addSeniorDeveloper [

	self developers add: (Senior producing: self devCoin)
]

{ #category : #'API -Events' }
Market >> addTraineeDeveloper [

	self developers add: (Trainee producing: self devCoin)
]

{ #category : #accessing }
Market >> currency [

	^ currency
]

{ #category : #accessing }
Market >> devCoin [

	^ currency baseUnit
]

{ #category : #accessing }
Market >> developers [

	^ developers
]

{ #category : #initialization }
Market >> initializeMarket [

	currency := Measure amount: 0 unit: DevCoin new.		
	developers := OrderedCollection new.
]

{ #category : #'API -Events' }
Market >> produce [

	| totalProduction |
	
	totalProduction :=
		self developers
			inject: (Measure amount: 0 unit: self devCoin)
			into: [ :production :dev | production addMeasure: dev productionPerTick ].
	
	self updateCurrencyWith: totalProduction
]

{ #category : #'private - setters' }
Market >> updateCurrencyWith: totalProduction [

	currency := currency + totalProduction
]
