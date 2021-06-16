Class {
	#name : #CTSpecificationPatternCargo,
	#superclass : #Object,
	#instVars : [
		'specification'
	],
	#category : #'Containers-SpecificationPattern-Tests'
}

{ #category : #testing }
CTSpecificationPatternCargo >> canBePutInto: aContainer [ 
	^ specification isSatisfiedBy: aContainer 
]

{ #category : #private }
CTSpecificationPatternCargo >> specification: aSpecification [ 
	specification := aSpecification 
]
