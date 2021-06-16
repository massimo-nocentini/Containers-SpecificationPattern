Class {
	#name : #Container,
	#superclass : #Object,
	#instVars : [
		'workingTemperatureInterval',
		'isSanitaryForFood'
	],
	#category : #'SpecificationPattern-Tests'
}

{ #category : #testing }
Container >> canMaintainTemperatureBelow: aTemperature [
	^ workingTemperatureInterval last <= aTemperature
]

{ #category : #testing }
Container >> isSanitaryForFood [
	^ isSanitaryForFood
]

{ #category : #accessing }
Container >> maxWorkingTemperature [
	^ workingTemperatureInterval last .
]

{ #category : #private }
Container >> workingTemperatureInterval: anInterval isSanitaryForFood: aBoolean [ 
	workingTemperatureInterval := anInterval .
	isSanitaryForFood := aBoolean .
]
