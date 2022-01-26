Class {
	#name : #MCPDevWebApplication,
	#superclass : #WillowApplication,
	#instVars : [
		'currencyView',
		'market',
		'marketWebView',
		'produceButton',
		'juniorBuy',
		'traineeBuy'
	],
	#category : #'MCPDev-web'
}

{ #category : #accessing }
MCPDevWebApplication class >> applicationTitle [
	
	^'MCPDev'
]

{ #category : #accessing }
MCPDevWebApplication class >> handlerName [

	^'mcp-dev'
]

{ #category : #accessing }
MCPDevWebApplication class >> start [

	(ZnZincServerAdaptor port: 8080) start.
	self registerAsDevelopmentApplication
]

{ #category : #accessing }
MCPDevWebApplication class >> stop [

	(ZnZincServerAdaptor port: 8080) stop.
	self unregisterFromApplications
]

{ #category : #accessing }
MCPDevWebApplication >> componentSupplier [
	
	^ self componentSupplierForApplication
]

{ #category : #accessing }
MCPDevWebApplication >> componentSupplierForApplication [

	^ Bootstrap3ComponentSupplier online
]

{ #category : #initialization }
MCPDevWebApplication >> configureInteractions [

	produceButton on trigger
		serverDo: [ 
			self market produce ];
		render: currencyView.
		
	traineeBuy on trigger
		serverDo: [
			self market buyTraineeDeveloper ];
		render: currencyView.
]

{ #category : #rendering }
MCPDevWebApplication >> contentView [

	^ [ :canvas |
			canvas
				render: currencyView;
				render: traineeBuy;
				render: juniorBuy;
				render: produceButton ]
]

{ #category : #initialization }
MCPDevWebApplication >> initialRequest: request [

	self
		initializeMarket;
		initializeCurrencyView;
		initializeProduceButton;
		initializeDevBuyingButtons;
		configureInteractions
]

{ #category : #initialization }
MCPDevWebApplication >> initializeCurrencyView [

	currencyView := self componentSupplier divisionContainerWrapping: [ :canvas | canvas render: self market currency ] applying: [  ]
]

{ #category : #initialization }
MCPDevWebApplication >> initializeDevBuyingButtons [

	self
		initializeTraineeBuyingButton;
		initializeJuniorBuyingButton
]

{ #category : #initialization }
MCPDevWebApplication >> initializeJuniorBuyingButton [

	juniorBuy := self componentSupplier asynchronicButtonLabeled: 'Purchase Junior Dev' applying: [ ]
]

{ #category : #initialization }
MCPDevWebApplication >> initializeMarket [

	market := Market new
]

{ #category : #initialization }
MCPDevWebApplication >> initializeProduceButton [

	produceButton := self componentSupplier asynchronicButtonLabeled: 'Produce' applying:  [ ]
]

{ #category : #initialization }
MCPDevWebApplication >> initializeTraineeBuyingButton [

	traineeBuy := self componentSupplier asynchronicButtonLabeled: 'Purchase Trainee Dev' applying: [ ]
]

{ #category : #accessing }
MCPDevWebApplication >> jQueryLibrary [

	^ JQuery3OnlineLibrary default
]

{ #category : #accessing }
MCPDevWebApplication >> market [

	^ market
]
