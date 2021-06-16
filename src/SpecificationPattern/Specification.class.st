"
I'm the abstract class in order to catch the concept of a specification object. It may serve as an entry point for the little DSL that we're going to implement.
"
Class {
	#name : #Specification,
	#superclass : #Object,
	#category : #SpecificationPattern
}

{ #category : #'instance creation' }
Specification class >> attributeNamed: aName isEquals: aValue [
	^ EqualsSpecification new attributeName: aName magnitude: aValue   
]

{ #category : #'instance creation' }
Specification class >> attributeNamed: aName isLessThan: aValue [ 
	^ LessThanSpecification new attributeName: aName magnitude: aValue .  
]

{ #category : #'composite creation' }
Specification >> and: anotherSpecification [ 
	^ ConjuctionSpecification with: self with: anotherSpecification .
]

{ #category : #subsuming }
Specification >> isGeneralizationOf: aSpecification [ 
	self subclassResponsibility .
]

{ #category : #satisfaction }
Specification >> isSatisfiedBy: aCandidate [
	"this is a Choosing Message in order to express a polymorphic behavior for a generic specification"

	^ self subclassResponsibility 
]

{ #category : #subsuming }
Specification >> isSpecialCaseOf: aSpecification [ 
	^ aSpecification isGeneralizationOf: self .
]

{ #category : #subsuming }
Specification >> isSpecialCaseOfEqualSpecification: anEqualSpecification [ 
	"In the general case, it does not."
	
	^ false
]

{ #category : #subsuming }
Specification >> isSpecialCaseOfLessThanSpecification: aLessThanSpecification [ 
	"In the general case, it does not."
	
	^ false
]

{ #category : #subsuming }
Specification >> isSpecialCaseOfValueBoundSpecification: aSpecification [ 
	"In the general case, I'm not"
	^ false
]

{ #category : #subsuming }
Specification >> isSpecialCaseOfValueBoundWithSameNameSpecification: aSpecification [ 
	"In the general case, I'm not"
	^ false
]

{ #category : #'composite creation' }
Specification >> or: anotherSpec [ 
	^ DisjunctionSpecification new spec: self anotherSpec: anotherSpec .
]
