Class {
	#name : #MaximumTemperatureSpecification,
	#superclass : #Specification,
	#instVars : [
		'maxTemperatureAllowed'
	],
	#category : #'SpecificationPattern-Tests'
}

{ #category : #'as yet unclassified' }
MaximumTemperatureSpecification >> isSatisfiedBy: aContainer [ 
	^ aContainer canMaintainTemperatureBelow: maxTemperatureAllowed 
]

{ #category : #private }
MaximumTemperatureSpecification >> maxTemperatureAllowed: aTemperature [ 
	maxTemperatureAllowed := aTemperature
]
