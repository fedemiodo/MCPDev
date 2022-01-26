Class {
	#name : #MarketTest,
	#superclass : #TestCase,
	#category : #'MCPDev-modelTest-Tests'
}

{ #category : #tests }
MarketTest >> testBuyingATrainee [
	
	| market |
	
	market := Market new.
	
	self
		assert: market devCoin name equals: 'DevCoin';
		assert: market currency amount equals: 10;
		assertEmpty: market developers.
		
	market buyTraineeDeveloper.
	
	self
		assert: market devCoin name equals: 'DevCoin';
		assert: market currency amount equals: 0;
		withTheOnlyOneIn: market developers do: [ :dev |
			self
				assert: dev seniority equals: 'Trainee';
				assert: dev productionPerTick baseUnit equals: market devCoin;
				assert: dev productionPerTick amount equals: 1 ]
]

{ #category : #tests }
MarketTest >> testBuyingATraineeAndProducingCurrency [
	
	| market |
	
	market := Market new.
	
	self
		assert: market devCoin name equals: 'DevCoin';
		assert: market currency amount equals: 10;
		assertEmpty: market developers.
		
	market buyTraineeDeveloper.
	
	self
		assert: market devCoin name equals: 'DevCoin';
		assert: market currency amount equals: 0;
		withTheOnlyOneIn: market developers do: [ :dev |
			self
				assert: dev seniority equals: 'Trainee';
				assert: dev productionPerTick baseUnit equals: market devCoin;
				assert: dev productionPerTick amount equals: 1 ].
	
	market produce.
	
	self
		assert: market currency amount equals: 1
]

{ #category : #tests }
MarketTest >> testBuyingATraineeAndProducingCurrencyManyTimes [
	
	| market |
	
	market := Market new.
	
	self
		assert: market devCoin name equals: 'DevCoin';
		assert: market currency amount equals: 10;
		assertEmpty: market developers.
		
	market buyTraineeDeveloper.
	
	self
		assert: market devCoin name equals: 'DevCoin';
		assert: market currency amount equals: 0;
		withTheOnlyOneIn: market developers do: [ :dev |
			self
				assert: dev seniority equals: 'Trainee';
				assert: dev productionPerTick baseUnit equals: market devCoin;
				assert: dev productionPerTick amount equals: 1 ].
	
	1 to: 10 do: [ :number | market produce ].
	
	self assert: market currency amount equals: 10
]

{ #category : #tests }
MarketTest >> testBuyingMultipleDevsAndProducingCurrency [
	
	| market |
	
	market := Market startingWithCurrency: 10000.
	
	self
		assert: market currency amount equals: 10000;
		assertEmpty: market developers.
		
	market
		buyTraineeDeveloper;
		buyJuniorDeveloper.
	
	self
		assert: market currency amount equals: 9940;
		assert: market developers size equals: 2.
	
	market produce.
	
	self
		assert: market currency amount equals: 9946
]

{ #category : #tests }
MarketTest >> testCannotAffordADeveloper [
	
	| market |
	
	market := Market new.
	
	self
		assert: market devCoin name equals: 'DevCoin';
		assert: market currency amount equals: 10;
		assertEmpty: market developers.
		
	market buyTraineeDeveloper.
	
	self
		assert: market developers size equals: 1;
		assert: market currency amount equals: 0.
	
	self
		should: [ market buyTraineeDeveloper ] raise: Notification withMessageText: 'Must have enough coins.'
]

{ #category : #tests }
MarketTest >> testInstanceCreation [
	
	| marketDefault marketPumped |
	
	marketDefault := Market new.
	marketPumped := Market startingWithCurrency: 10000.
	
	self
		assert: marketDefault devCoin name equals: 'DevCoin';
		assert: marketDefault currency amount equals: 10;
		assertEmpty: marketDefault developers.
		
	self
		assert: marketPumped devCoin name equals: 'DevCoin';
		assert: marketPumped currency amount equals: 10000;
		assertEmpty: marketPumped developers
]

{ #category : #tests }
MarketTest >> testMultipleDevsAndProducingCurrency [
	
	| market |
	
	market := Market new.
	
	self
		assert: market devCoin name equals: 'DevCoin';
		assert: market currency amount equals: 10;
		assertEmpty: market developers.
		
	market buyTraineeDeveloper.
	
	self
		assert: market developers size equals: 1;
		assert: market currency amount equals: 0.
	
	1 to: 100 do: [ :number | market produce ].
	self assert: market currency amount equals: 100.
	
	market buyTraineeDeveloper.
	
	self
		assert: market developers size equals: 2;
		assert: market currency amount equals: 90.
		
	market produce.
	
	self
		assert: market currency amount equals: 92
]
