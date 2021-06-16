Class {
	#name : #CTEqualsSpecification,
	#superclass : #CTValueBoundSpecification,
	#category : #'Containers-SpecificationPattern'
}

{ #category : #subsuming }
CTEqualsSpecification >> isGeneralizationOfValueBoundSpecification: aValueBoundWithSameNameSpecification [ 
	^ aValueBoundWithSameNameSpecification isSpecialCaseOfEqualSpecification: self . 
]

{ #category : #satisfaction }
CTEqualsSpecification >> isSatisfiedBy: aCandidate [ 
	^ (aCandidate perform: attributeName) = value .
]

{ #category : #subsuming }
CTEqualsSpecification >> isSpecialCaseOfEqualSpecification: anEqualSpecification [
	^ self magnitude = anEqualSpecification magnitude .
]

{ #category : #subsuming }
CTEqualsSpecification >> isSpecialCaseOfLessThanSpecification: aLessThanSpecification [
	^ self magnitude <= aLessThanSpecification magnitude .
]
