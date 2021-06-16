Class {
	#name : #CTSanitaryForFoodSpecification,
	#superclass : #CTSpecification,
	#category : #'Containers-SpecificationPattern-Tests'
}

{ #category : #'as yet unclassified' }
CTSanitaryForFoodSpecification >> isSatisfiedBy: aContainer [ 
	^ aContainer isSanitaryForFood
]
