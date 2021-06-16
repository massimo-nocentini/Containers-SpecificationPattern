Class {
	#name : #DisjunctionSpecification,
	#superclass : #Specification,
	#instVars : [
		'anotherSpecification',
		'specification'
	],
	#category : #'Containers-SpecificationPattern'
}

{ #category : #subsuming }
DisjunctionSpecification >> isGeneralizationOf: aSpecification [
	"True if some component is subsumed. False if all component is not subsumed."
	^ (specification isGeneralizationOf: aSpecification ) or: 
		[ anotherSpecification isGeneralizationOf: aSpecification  ] .
]

{ #category : #satisfaction }
DisjunctionSpecification >> isSatisfiedBy: aCandidate [ 
	^ (specification isSatisfiedBy: aCandidate ) or: [ anotherSpecification isSatisfiedBy: aCandidate  ]
]

{ #category : #'composite creation' }
DisjunctionSpecification >> spec: aSpec anotherSpec: anotherSpec [ 
	specification := aSpec .
	anotherSpecification := anotherSpec . 
]
