Class {
	#name : #DevCoin,
	#superclass : #BaseUnit,
	#category : #'MCPDev-model'
}

{ #category : #accessing }
DevCoin class >> new [

	^self nameForOne: 'DevCoin' nameForMany: 'DevCoins' sign: 'DC'
]
