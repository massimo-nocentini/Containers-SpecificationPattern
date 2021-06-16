Class {
	#name : #ConjuctionSpecification,
	#superclass : #Specification,
	#instVars : [
		'specification',
		'anotherSpecification'
	],
	#category : #'Containers-SpecificationPattern'
}

{ #category : #'instance creation' }
ConjuctionSpecification class >> with: aSpecification with: anotherSpecification [ 
	
	| conj |
	
	conj := self new .
	conj spec: aSpecification anotherSpec: anotherSpecification . 
	^ conj
]

{ #category : #subsuming }
ConjuctionSpecification >> isGeneralizationOf: aSpecification [
	"True if each component is subsumed. False if any component is not subsumed."
	^ (specification isGeneralizationOf: aSpecification ) and: 
		[ anotherSpecification isGeneralizationOf: aSpecification  ] .
]

{ #category : #satisfaction }
ConjuctionSpecification >> isSatisfiedBy: aCandidate [
	^ (specification isSatisfiedBy: aCandidate) and: [ anotherSpecification isSatisfiedBy: aCandidate ]
]

{ #category : #subsuming }
ConjuctionSpecification >> isSpecialCaseOfValueBoundSpecification: aValueBoundSpecification [ 
	^ (aValueBoundSpecification isGeneralizationOf: specification ) or: 
		[ aValueBoundSpecification isGeneralizationOf: anotherSpecification  ] . 
]

{ #category : #private }
ConjuctionSpecification >> spec: aSpec anotherSpec: anotherSpec [ 
	specification := aSpec .
	anotherSpecification := anotherSpec .
]
