Class {
	#name : #EqualsSpecification,
	#superclass : #ValueBoundSpecification,
	#category : #'Containers-SpecificationPattern'
}

{ #category : #subsuming }
EqualsSpecification >> isGeneralizationOfValueBoundSpecification: aValueBoundWithSameNameSpecification [ 
	^ aValueBoundWithSameNameSpecification isSpecialCaseOfEqualSpecification: self . 
]

{ #category : #satisfaction }
EqualsSpecification >> isSatisfiedBy: aCandidate [ 
	^ (aCandidate perform: attributeName) = value .
]

{ #category : #subsuming }
EqualsSpecification >> isSpecialCaseOfEqualSpecification: anEqualSpecification [
	^ self magnitude = anEqualSpecification magnitude .
]

{ #category : #subsuming }
EqualsSpecification >> isSpecialCaseOfLessThanSpecification: aLessThanSpecification [
	^ self magnitude <= aLessThanSpecification magnitude .
]
