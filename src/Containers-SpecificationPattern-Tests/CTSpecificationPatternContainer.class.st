Class {
	#name : #CTSpecificationPatternContainer,
	#superclass : #Object,
	#instVars : [
		'workingTemperatureInterval',
		'isSanitaryForFood'
	],
	#category : #'Containers-SpecificationPattern-Tests'
}

{ #category : #testing }
CTSpecificationPatternContainer >> canMaintainTemperatureBelow: aTemperature [
	^ workingTemperatureInterval last <= aTemperature
]

{ #category : #testing }
CTSpecificationPatternContainer >> isSanitaryForFood [
	^ isSanitaryForFood
]

{ #category : #accessing }
CTSpecificationPatternContainer >> maxWorkingTemperature [
	^ workingTemperatureInterval last .
]

{ #category : #private }
CTSpecificationPatternContainer >> workingTemperatureInterval: anInterval isSanitaryForFood: aBoolean [ 
	workingTemperatureInterval := anInterval .
	isSanitaryForFood := aBoolean .
]
