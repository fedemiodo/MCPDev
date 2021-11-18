Class {
	#name : #DevCoin,
	#superclass : #Measure,
	#category : #'MCPDev-model'
}

{ #category : #accessing }
DevCoin class >> amount: aNumber [

	^self amount: aNumber unit: (BaseUnit nameForOne: 'DevCoin' nameForMany: 'DevCoins' sign: 'DC')
]
