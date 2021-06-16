Class {
	#name : #LessThanSpecification,
	#superclass : #ValueBoundSpecification,
	#category : #SpecificationPattern
}

{ #category : #subsuming }
LessThanSpecification >> isGeneralizationOfValueBoundSpecification: aValueBoundWithSameNameSpecification [
	^ aValueBoundWithSameNameSpecification isSpecialCaseOfLessThanSpecification: self .
]

{ #category : #satisfaction }
LessThanSpecification >> isSatisfiedBy: aCandidate [ 
	^ (aCandidate perform: attributeName ) < value .
]

{ #category : #subsuming }
LessThanSpecification >> isSpecialCaseOfLessThanSpecification: aLessThanSpecification [
	^ self magnitude <= aLessThanSpecification magnitude .
]
