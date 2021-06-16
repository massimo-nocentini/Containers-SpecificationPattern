Class {
	#name : #SanitaryForFoodSpecification,
	#superclass : #Specification,
	#category : #'SpecificationPattern-Tests'
}

{ #category : #'as yet unclassified' }
SanitaryForFoodSpecification >> isSatisfiedBy: aContainer [ 
	^ aContainer isSanitaryForFood
]
