Class {
	#name : #MarketTest,
	#superclass : #TestCase,
	#category : #'MCPDev-modelTest'
}

{ #category : #tests }
MarketTest >> testInstanceCreation [
	
	| market |
	
	market := Market new.
	
	self
		withTheOnlyOneIn: market currencies do: [ :currency | self assert: currency name equals: 'DevCoin' ];
		assertEmpty: market developers
]
