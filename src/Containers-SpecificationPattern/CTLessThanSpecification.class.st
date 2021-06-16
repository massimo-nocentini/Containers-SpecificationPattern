Class {
	#name : #CTLessThanSpecification,
	#superclass : #CTValueBoundSpecification,
	#category : #'Containers-SpecificationPattern'
}

{ #category : #subsuming }
CTLessThanSpecification >> isGeneralizationOfValueBoundSpecification: aValueBoundWithSameNameSpecification [
	^ aValueBoundWithSameNameSpecification isSpecialCaseOfLessThanSpecification: self .
]

{ #category : #satisfaction }
CTLessThanSpecification >> isSatisfiedBy: aCandidate [ 
	^ (aCandidate perform: attributeName ) < value .
]

{ #category : #subsuming }
CTLessThanSpecification >> isSpecialCaseOfLessThanSpecification: aLessThanSpecification [
	^ self magnitude <= aLessThanSpecification magnitude .
]
