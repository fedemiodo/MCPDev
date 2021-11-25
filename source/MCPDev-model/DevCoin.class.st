Class {
	#name : #DevCoin,
	#superclass : #BaseUnit,
	#category : #'MCPDev-model-Model'
}

{ #category : #'instance creation' }
DevCoin class >> nameForOne: aString nameForMany: anotherString sign: aSignString [

	^super new initializeNameForOne: aString nameForMany: anotherString sign: aSignString
]

{ #category : #accessing }
DevCoin class >> new [

	^self nameForOne: 'DevCoin' nameForMany: 'DevCoins' sign: 'DC'
]
