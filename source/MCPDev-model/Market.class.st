Class {
	#name : #Market,
	#superclass : #Object,
	#instVars : [
		'currencies',
		'developers'
	],
	#category : #'MCPDev-model'
}

{ #category : #'instance creation' }
Market class >> new [

	^super new initializeMarket
]

{ #category : #'API -Events' }
Market >> addJuniorDeveloper [

	self developers add: Junior new
]

{ #category : #'API -Events' }
Market >> addSemiSeniorDeveloper [

	self developers add: SemiSenior new
]

{ #category : #'API -Events' }
Market >> addSeniorDeveloper [

	self developers add: Senior new
]

{ #category : #'API -Events' }
Market >> addTraineeDeveloper [

	self developers add: Trainee new
]

{ #category : #accessing }
Market >> currencies [

	^currencies
]

{ #category : #accessing }
Market >> devCoin [

	^BaseUnit nameForOne: 'DevCoin' nameForMany: 'DevCoins' sign: 'DC'
]

{ #category : #accessing }
Market >> developers [

	^developers
]

{ #category : #initialization }
Market >> initializeMarket [

	currencies := OrderedCollection
		with: self devCoin.
		
	developers := OrderedCollection new.
]
