Class {
	#name : #CTDisjunctionSpecification,
	#superclass : #CTSpecification,
	#instVars : [
		'anotherSpecification',
		'specification'
	],
	#category : #'Containers-SpecificationPattern'
}

{ #category : #subsuming }
CTDisjunctionSpecification >> isGeneralizationOf: aSpecification [
	"True if some component is subsumed. False if all component is not subsumed."
	^ (specification isGeneralizationOf: aSpecification ) or: 
		[ anotherSpecification isGeneralizationOf: aSpecification  ] .
]

{ #category : #satisfaction }
CTDisjunctionSpecification >> isSatisfiedBy: aCandidate [ 
	^ (specification isSatisfiedBy: aCandidate ) or: [ anotherSpecification isSatisfiedBy: aCandidate  ]
]

{ #category : #'composite creation' }
CTDisjunctionSpecification >> spec: aSpec anotherSpec: anotherSpec [ 
	specification := aSpec .
	anotherSpecification := anotherSpec . 
]
