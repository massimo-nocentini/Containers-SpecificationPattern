Class {
	#name : #CTConjuctionSpecification,
	#superclass : #CTSpecification,
	#instVars : [
		'specification',
		'anotherSpecification'
	],
	#category : #'Containers-SpecificationPattern'
}

{ #category : #'instance creation' }
CTConjuctionSpecification class >> with: aSpecification with: anotherSpecification [ 
	
	| conj |
	
	conj := self new .
	conj spec: aSpecification anotherSpec: anotherSpecification . 
	^ conj
]

{ #category : #subsuming }
CTConjuctionSpecification >> isGeneralizationOf: aSpecification [
	"True if each component is subsumed. False if any component is not subsumed."
	^ (specification isGeneralizationOf: aSpecification ) and: 
		[ anotherSpecification isGeneralizationOf: aSpecification  ] .
]

{ #category : #satisfaction }
CTConjuctionSpecification >> isSatisfiedBy: aCandidate [
	^ (specification isSatisfiedBy: aCandidate) and: [ anotherSpecification isSatisfiedBy: aCandidate ]
]

{ #category : #subsuming }
CTConjuctionSpecification >> isSpecialCaseOfValueBoundSpecification: aValueBoundSpecification [ 
	^ (aValueBoundSpecification isGeneralizationOf: specification ) or: 
		[ aValueBoundSpecification isGeneralizationOf: anotherSpecification  ] . 
]

{ #category : #private }
CTConjuctionSpecification >> spec: aSpec anotherSpec: anotherSpec [ 
	specification := aSpec .
	anotherSpecification := anotherSpec .
]
