Class {
	#name : #ValueBoundSpecification,
	#superclass : #Specification,
	#instVars : [
		'attributeName',
		'value'
	],
	#category : #SpecificationPattern
}

{ #category : #accessing }
ValueBoundSpecification >> attributeName [
	^ attributeName .
]

{ #category : #private }
ValueBoundSpecification >> attributeName: aName magnitude: aValue [ 
	attributeName := aName . 
	value := aValue .  
	^ self .
]

{ #category : #subsuming }
ValueBoundSpecification >> isGeneralizationOf: aSpecification [ 
	^ aSpecification isSpecialCaseOfValueBoundSpecification: self .
]

{ #category : #subsuming }
ValueBoundSpecification >> isGeneralizationOfValueBoundSpecification: aSpecification [ 
	self subclassResponsibility .
]

{ #category : #subsuming }
ValueBoundSpecification >> isSpecialCaseOfValueBoundSpecification: aValueBoundSpecification [ 
	^ (attributeName = aValueBoundSpecification attributeName  ) and: 
		[ self isSpecialCaseOfValueBoundWithSameNameSpecification: aValueBoundSpecification ] . 
]

{ #category : #subsuming }
ValueBoundSpecification >> isSpecialCaseOfValueBoundWithSameNameSpecification: aValueBoundWithSameNameSpecification [ 
	^ aValueBoundWithSameNameSpecification isGeneralizationOfValueBoundSpecification: self .
]

{ #category : #accessing }
ValueBoundSpecification >> magnitude [
	^ value .
]
