Class {
	#name : #DevTest,
	#superclass : #TestCase,
	#category : #'MCPDev-modelTest'
}

{ #category : #tests }
DevTest >> testDifferentDevelopers [

	| trainee junior semiSenior senior|

	trainee := Trainee new.
	junior := Junior new.
	semiSenior := SemiSenior new.
	senior := Senior new.


	self
		assert: trainee seniority equals: 'Trainee';
		assert: trainee productionPerTick amount equals: 1;
		assert: junior seniority equals: 'Junior';
		assert: junior productionPerTick amount equals: 5;
		assert: semiSenior seniority equals: 'SemiSenior';
		assert: semiSenior productionPerTick amount equals: 25;
		assert: senior seniority equals: 'Senior';
		assert: senior productionPerTick amount equals: 125
]

{ #category : #tests }
DevTest >> testInstanceCreation [

	| dev |
	
	dev := Trainee new.
	
	self
		assert: dev seniority equals: 'Trainee';
		assert: dev productionPerTick amount equals: 1
]

{ #category : #tests }
DevTest >> testProducingCurrency [

	| dev currency |
	
	currency := DevCoin amount: 0.
	dev := Trainee new.
	
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
