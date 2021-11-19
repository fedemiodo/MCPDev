Class {
	#name : #DevCoin,
	#superclass : #AnObsoleteBaseUnit,
	#category : #'MCPDev-model'
}

{ #category : #'instance creation' }
DevCoin class >> nameForOne: aString nameForMany: anotherString sign: aSignString [

	^super new initializeNameForOne: aString nameForMany: anotherString sign: aSignString
]

{ #category : #accessing }
DevCoin class >> new [

	^self nameForOne: 'DevCoin' nameForMany: 'DevCoins' sign: 'DC'
]
