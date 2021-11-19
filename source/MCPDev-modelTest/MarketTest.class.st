Class {
	#name : #MarketTest,
	#superclass : #TestCase,
	#category : #'MCPDev-modelTest'
}

{ #category : #tests }
MarketTest >> testAddingATrainee [
	
	| market |
	
	market := Market new.
	
	self
		assert: market devCoin name equals: 'DevCoin';
		assert: market currency amount equals: 0;
		assertEmpty: market developers.
		
	market addTraineeDeveloper.
	
	self
		assert: market devCoin name equals: 'DevCoin';
		assert: market currency amount equals: 0;
		withTheOnlyOneIn: market developers do: [ :dev |
			self
				assert: dev seniority equals: 'Trainee';
				assert: dev productionPerTick baseUnit equals: market devCoin;
				assert: dev productionPerTick amount equals: 1  ]
]

{ #category : #tests }
MarketTest >> testAddingATraineeAndProducingCurrency [
	
	| market |
	
	market := Market new.
	
	self
		assert: market currency amount equals: 0;
		assertEmpty: market developers.
		
	market addTraineeDeveloper.
	
	self
		assert: market currency amount equals: 0;
		withTheOnlyOneIn: market developers do: [ :dev |
			self
				assert: dev seniority equals: 'Trainee';
				assert: dev productionPerTick baseUnit equals: market devCoin;
				assert: dev productionPerTick amount equals: 1  ].
	
	market produce.
	
	self
		assert: market currency amount equals: 1
]

{ #category : #tests }
MarketTest >> testAddingMultipleDevsAndProducingCurrency [
	
	| market |
	
	market := Market new.
	
	self
		assert: market currency amount equals: 0;
		assertEmpty: market developers.
		
	market
		addTraineeDeveloper;
		addJuniorDeveloper.
	
	self
		assert: market currency amount equals: 0;
		assert: market developers size equals: 2.
	
	market produce.
	
	self
		assert: market currency amount equals: 6
]

{ #category : #tests }
MarketTest >> testInstanceCreation [
	
	| market |
	
	market := Market new.
	
	self
		assert: market devCoin name equals: 'DevCoin';
		assert: market currency amount equals: 0;
		assertEmpty: market developers
]
