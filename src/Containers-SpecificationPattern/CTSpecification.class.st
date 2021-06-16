"
I'm the abstract class in order to catch the concept of a specification object. It may serve as an entry point for the little DSL that we're going to implement.
"
Class {
	#name : #CTSpecification,
	#superclass : #Object,
	#category : #'Containers-SpecificationPattern'
}

{ #category : #'instance creation' }
CTSpecification class >> attributeNamed: aName isEquals: aValue [
	^ CTEqualsSpecification new attributeName: aName magnitude: aValue   
]

{ #category : #'instance creation' }
CTSpecification class >> attributeNamed: aName isLessThan: aValue [ 
	^ CTLessThanSpecification new attributeName: aName magnitude: aValue .  
]

{ #category : #'composite creation' }
CTSpecification >> and: anotherSpecification [ 
	^ CTConjuctionSpecification with: self with: anotherSpecification .
]

{ #category : #subsuming }
CTSpecification >> isGeneralizationOf: aSpecification [ 
	self subclassResponsibility .
]

{ #category : #satisfaction }
CTSpecification >> isSatisfiedBy: aCandidate [
	"this is a Choosing Message in order to express a polymorphic behavior for a generic specification"

	^ self subclassResponsibility 
]

{ #category : #subsuming }
CTSpecification >> isSpecialCaseOf: aSpecification [ 
	^ aSpecification isGeneralizationOf: self .
]

{ #category : #subsuming }
CTSpecification >> isSpecialCaseOfEqualSpecification: anEqualSpecification [ 
	"In the general case, it does not."
	
	^ false
]

{ #category : #subsuming }
CTSpecification >> isSpecialCaseOfLessThanSpecification: aLessThanSpecification [ 
	"In the general case, it does not."
	
	^ false
]

{ #category : #subsuming }
CTSpecification >> isSpecialCaseOfValueBoundSpecification: aSpecification [ 
	"In the general case, I'm not"
	^ false
]

{ #category : #subsuming }
CTSpecification >> isSpecialCaseOfValueBoundWithSameNameSpecification: aSpecification [ 
	"In the general case, I'm not"
	^ false
]

{ #category : #'composite creation' }
CTSpecification >> or: anotherSpec [ 
	^ CTDisjunctionSpecification new spec: self anotherSpec: anotherSpec .
]
