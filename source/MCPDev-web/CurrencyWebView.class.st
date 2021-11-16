Class {
	#name : #CurrencyWebView,
	#superclass : #WAPainter,
	#instVars : [
		'workingContext',
		'view'
	],
	#category : #'MCPDev-web'
}

{ #category : #'instance creation' }
CurrencyWebView class >> workingWith: aWorkingContext [

	^self new initializeWorkingWith: aWorkingContext 
]

{ #category : #accessing }
CurrencyWebView >> coins [

	^ workingContext coins
]

{ #category : #'instance creation' }
CurrencyWebView >> initializeWorkingWith: aWorkingContext [

	workingContext := aWorkingContext.
	
	view := self componentSupplier divisionContainerWrapping: [ :canvas | canvas render: self coins ] applying: [  ]
]

{ #category : #rendering }
CurrencyWebView >> renderContentOn: aCanvas [
	"This is the main rendering method of WAPainter. It will be called with an instance of
	the Renderer class returned by #rendererClass whenever this Painter is asked to render
	itself. By convention, implementations of this method that expect a Canvas renderer
	use 'html' as the parameter name."
	
	^ aCanvas render: view
]
