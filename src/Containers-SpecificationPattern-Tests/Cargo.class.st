Class {
	#name : #Cargo,
	#superclass : #Object,
	#instVars : [
		'specification'
	],
	#category : #'Containers-SpecificationPattern-Tests'
}

{ #category : #testing }
Cargo >> canBePutInto: aContainer [ 
	^ specification isSatisfiedBy: aContainer 
]

{ #category : #private }
Cargo >> specification: aSpecification [ 
	specification := aSpecification 
]
