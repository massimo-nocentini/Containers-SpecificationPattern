Class {
	#name : #CTValueBoundSpecification,
	#superclass : #CTSpecification,
	#instVars : [
		'attributeName',
		'value'
	],
	#category : #'Containers-SpecificationPattern'
}

{ #category : #accessing }
CTValueBoundSpecification >> attributeName [
	^ attributeName .
]

{ #category : #private }
CTValueBoundSpecification >> attributeName: aName magnitude: aValue [ 
	attributeName := aName . 
	value := aValue .  
	^ self .
]

{ #category : #subsuming }
CTValueBoundSpecification >> isGeneralizationOf: aSpecification [ 
	^ aSpecification isSpecialCaseOfValueBoundSpecification: self .
]

{ #category : #subsuming }
CTValueBoundSpecification >> isGeneralizationOfValueBoundSpecification: aSpecification [ 
	self subclassResponsibility .
]

{ #category : #subsuming }
CTValueBoundSpecification >> isSpecialCaseOfValueBoundSpecification: aValueBoundSpecification [ 
	^ (attributeName = aValueBoundSpecification attributeName  ) and: 
		[ self isSpecialCaseOfValueBoundWithSameNameSpecification: aValueBoundSpecification ] . 
]

{ #category : #subsuming }
CTValueBoundSpecification >> isSpecialCaseOfValueBoundWithSameNameSpecification: aValueBoundWithSameNameSpecification [ 
	^ aValueBoundWithSameNameSpecification isGeneralizationOfValueBoundSpecification: self .
]

{ #category : #accessing }
CTValueBoundSpecification >> magnitude [
	^ value .
]
