Class {
	#name : #BaselineOfMCPDev,
	#superclass : #BaselineOf,
	#category : #BaselineOfMCPDev
}

{ #category : #accessing }
BaselineOfMCPDev >> baseline: spec [

	<baseline>
	self setUpDependencies: spec.
	self setUpPackages: spec
]

{ #category : #accessing }
BaselineOfMCPDev >> projectClass [

	^MetacelloCypressBaselineProject
]

{ #category : #accessing }
BaselineOfMCPDev >> setUpDependencies: spec [

	spec baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6/source' ].
	spec baseline: 'WillowBootstrap' with: [ spec repository: 'github://ba-st/Willow-Bootstrap:v13/source' ].
	spec baseline: 'Aconcagua' with: [ spec repository: 'github://ba-st/Aconcagua:release-candidate/source' ]
]

{ #category : #accessing }
BaselineOfMCPDev >> setUpPackages: spec [

	spec for: #pharo do: [ 
		spec
			package: 'MCPDev-web' with: [ spec requires: #('WillowBootstrap' 'MCPDev-model') ];
			package: 'MCPDev-model' with: [ spec requires: #('Buoy' 'Aconcagua') ];
			package: 'MCPDev-modelTest'	with: [ spec requires: 'MCPDev-model' ].
				
		spec
			group: 'Tests' with: 'MCPDev-modelTest';
			group: 'Development' with: 'Tests' ]
]
