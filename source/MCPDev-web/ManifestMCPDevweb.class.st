"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMCPDevweb,
	#superclass : #PackageManifest,
	#category : #'MCPDev-web-Manifest'
}

{ #category : #'code-critics' }
ManifestMCPDevweb class >> ruleGRReturnFormattingRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'MCPDev-web')) #'2021-11-16T17:45:51.218865-03:00') )
]
