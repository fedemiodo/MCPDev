Class {
	#name : #MCPDevWebApplication,
	#superclass : #WAApplication,
	#instVars : [
		'currencyView'
	],
	#category : #'MCPDev-web'
}

{ #category : #initialization }
MCPDevWebApplication >> initialize [

	self
		initializeCurrencyView;
		initializeDevelopersView
]

{ #category : #initialization }
MCPDevWebApplication >> initializeCurrencyView [

	currencyView := CurrencyWebView workingWith: self.
]
