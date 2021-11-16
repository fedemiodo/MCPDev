"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMCPDevmodel,
	#superclass : #PackageManifest,
	#category : #'MCPDev-model-Manifest'
}

{ #category : #'code-critics' }
ManifestMCPDevmodel class >> ruleGRReturnFormattingRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'MCPDev-model')) #'2021-11-16T17:07:10.35643-03:00') )
]
