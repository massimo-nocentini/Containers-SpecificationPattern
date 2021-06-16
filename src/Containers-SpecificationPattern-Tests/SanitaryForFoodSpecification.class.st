Class {
	#name : #SanitaryForFoodSpecification,
	#superclass : #Specification,
	#category : #'Containers-SpecificationPattern-Tests'
}

{ #category : #'as yet unclassified' }
SanitaryForFoodSpecification >> isSatisfiedBy: aContainer [ 
	^ aContainer isSanitaryForFood
]
