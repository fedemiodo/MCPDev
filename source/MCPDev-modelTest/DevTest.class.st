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
		assert: trainee production equals: 1;
		assert: junior seniority equals: 'Junior';
		assert: junior production equals: 5;
		assert: semiSenior seniority equals: 'SemiSenior';
		assert: semiSenior production equals: 25;
		assert: senior seniority equals: 'Senior';
		assert: senior production equals: 125
]

{ #category : #tests }
DevTest >> testInstanceCreation [

	| dev |
	
	dev := Trainee new.
	
	self
		assert: dev seniority equals: 'Trainee';
		assert: dev production equals: 1
]
