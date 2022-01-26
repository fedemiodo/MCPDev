Class {
	#name : #DevTest,
	#superclass : #TestCase,
	#instVars : [
		'devCoin',
		'trainee',
		'junior',
		'semiSenior',
		'senior'
	],
	#category : #'MCPDev-modelTest-Tests'
}

{ #category : #accessing }
DevTest >> devCoin [

	^ devCoin 
]

{ #category : #accessing }
DevTest >> junior [

	^ junior
]

{ #category : #accessing }
DevTest >> semiSenior [

	^ semiSenior
]

{ #category : #accessing }
DevTest >> senior [

	^ senior
]

{ #category : #running }
DevTest >> setUp [
	
	devCoin := DevCoin new.
	trainee := Trainee producing: self devCoin.
	junior := Junior producing: self devCoin.
	semiSenior := SemiSenior producing: self devCoin.
	senior := Senior producing: self devCoin
]

{ #category : #tests }
DevTest >> testInstanceCreation [
	
	self
		assert: self trainee seniority equals: 'Trainee';
		assert: self trainee productionPerTick amount equals: 1;
		assert: self trainee cost equals: 10;
		assert: self junior seniority equals: 'Junior';
		assert: self junior productionPerTick amount equals: 5;
		assert: self junior cost equals: 50;
		assert: self semiSenior seniority equals: 'SemiSenior';
		assert: self semiSenior productionPerTick amount equals: 25;
		assert: self semiSenior cost equals: 250;
		assert: self senior seniority equals: 'Senior';
		assert: self senior productionPerTick amount equals: 125;
		assert: self senior cost equals: 2500
]

{ #category : #tests }
DevTest >> testProducingCurrency [
	
	| currency dev |
	
	currency := Measure amount: 0 unit: self devCoin.
	dev := self trainee.
	
	self
		assert: dev productionPerTick amount equals: 1;
		assert: currency amount equals: 0.
		
	currency := dev produce: currency.
	
	self
		assert: dev productionPerTick amount equals: 1;
		assert: currency amount equals: 1.
	
	1 to: 10 do: [ :value | currency := dev produce: currency ].
	
	self
		assert: dev productionPerTick amount equals: 1;
		assert: currency amount equals: 11
]

{ #category : #accessing }
DevTest >> trainee [

	^trainee
]
