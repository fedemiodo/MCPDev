Class {
	#name : #MarketWebView,
	#superclass : #WAPainter,
	#instVars : [
		'market'
	],
	#category : #'MCPDev-web'
}

{ #category : #'instance creation' }
MarketWebView class >> for: aMarket [

	^super new initializeFor: aMarket
]

{ #category : #accessing }
MarketWebView >> currency [ 

	^ self market currency
]

{ #category : #accessing }
MarketWebView >> developers [ 

	^ self market developers
]

{ #category : #initialization }
MarketWebView >> initializeFor: aMarket [

	market := aMarket 
]

{ #category : #accessing }
MarketWebView >> market [ 

	^ market
]

{ #category : #rendering }
MarketWebView >> renderContentOn: aRenderer [

	^ aRenderer render: self currency
]
