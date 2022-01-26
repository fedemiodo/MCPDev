Class {
	#name : #Market,
	#superclass : #Object,
	#instVars : [
		'developers',
		'currency'
	],
	#category : #'MCPDev-model-Model'
}

{ #category : #'instance creation' }
Market class >> new [

	^ super new initializeMarketWithCurrency: 10
]

{ #category : #'instance creation' }
Market class >> startingWithCurrency: anAmount [

	^ super new initializeMarketWithCurrency: anAmount
]

{ #category : #asserting }
Market >> assertCanAfford: aMeasure [

	AssertionChecker
		enforce: [ self currency >= aMeasure ]
		because: 'Must have enough coins.'
		raising: Notification
]

{ #category : #'private - setters' }
Market >> buy: aDeveloper [

	self developers add: aDeveloper.
	self updateCurrencyWith: (Measure amount: aDeveloper cost unit: self devCoin) negated
	
	
]

{ #category : #'API - Events' }
Market >> buyJuniorDeveloper [

	self assertCanAfford: self newJuniorCost.

	self buy: self junior
]

{ #category : #'API - Events' }
Market >> buySemiSeniorDeveloper [

	self assertCanAfford: self newSemiSeniorCost.

	self buy: self semiSenior
]

{ #category : #'API - Events' }
Market >> buySeniorDeveloper [

	self assertCanAfford: self newSeniorCost.

	self buy: self senior
]

{ #category : #'API - Events' }
Market >> buyTraineeDeveloper [

	self assertCanAfford: self newTraineeCost.

	self buy: self trainee
]

{ #category : #accessing }
Market >> currency [

	^ currency
]

{ #category : #accessing }
Market >> devCoin [

	^ currency baseUnit
]

{ #category : #'private - setters' }
Market >> devCoins: anAmount [

	^ (Measure amount: anAmount unit: self devCoin)
]

{ #category : #accessing }
Market >> developers [

	^ developers
]

{ #category : #initialization }
Market >> initializeMarketWithCurrency: anAmount [

	currency := Measure amount: anAmount unit: DevCoin new.		
	developers := OrderedCollection new.
]

{ #category : #'accessing - private' }
Market >> junior [

	^ Junior producing: self devCoin
]

{ #category : #'API - Events' }
Market >> newJuniorCost [

	^ self devCoins: self junior cost
]

{ #category : #'API - Events' }
Market >> newSemiSeniorCost [

	^ self devCoins: self semiSenior cost
]

{ #category : #'API - Events' }
Market >> newSeniorCost [

	^ self devCoins: self senior cost
]

{ #category : #'API - Events' }
Market >> newTraineeCost [

	^ self devCoins: self trainee cost
]

{ #category : #'API - Events' }
Market >> produce [

	| totalProduction |
	
	totalProduction :=
		self developers
			inject: (self devCoins: 0)
			into: [ :production :dev | production + dev productionPerTick ].
	
	self updateCurrencyWith: totalProduction
]

{ #category : #'accessing - private' }
Market >> semiSenior [

	^ SemiSenior producing: self devCoin
]

{ #category : #'accessing - private' }
Market >> senior [

	^ Senior producing: self devCoin
]

{ #category : #'accessing - private' }
Market >> trainee [

	^ Trainee producing: self devCoin
]

{ #category : #'private - setters' }
Market >> updateCurrencyWith: totalProduction [

	currency := currency + totalProduction
]
