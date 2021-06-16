Class {
	#name : #CTMaximumTemperatureSpecification,
	#superclass : #CTSpecification,
	#instVars : [
		'maxTemperatureAllowed'
	],
	#category : #'Containers-SpecificationPattern-Tests'
}

{ #category : #'as yet unclassified' }
CTMaximumTemperatureSpecification >> isSatisfiedBy: aContainer [ 
	^ aContainer canMaintainTemperatureBelow: maxTemperatureAllowed 
]

{ #category : #private }
CTMaximumTemperatureSpecification >> maxTemperatureAllowed: aTemperature [ 
	maxTemperatureAllowed := aTemperature
]
