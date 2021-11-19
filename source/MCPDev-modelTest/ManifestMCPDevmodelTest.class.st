"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMCPDevmodelTest,
	#superclass : #PackageManifest,
	#category : #'MCPDev-modelTest-Manifest'
}

{ #category : #'code-critics' }
ManifestMCPDevmodelTest class >> ruleGRReturnFormattingRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'MCPDev-modelTest')) #'2021-11-19T01:22:04.079761-03:00') )
]
