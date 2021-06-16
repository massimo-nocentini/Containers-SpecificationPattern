Class {
	#name : #CTCargoContainerTest,
	#superclass : #TestCase,
	#instVars : [
		'cargo',
		'container'
	],
	#category : #'Containers-SpecificationPattern-Tests'
}

{ #category : #'as yet unclassified' }
CTCargoContainerTest >> setUp [ 
	cargo := CTSpecificationPatternCargo new .
	container := CTSpecificationPatternContainer new . 
]

{ #category : #'composite specifications' }
CTCargoContainerTest >> testConjunctionOfTwoSpecifications [

	|firstSpec secondSpec conjSpec|
	
	firstSpec := CTMaximumTemperatureSpecification new .
	firstSpec maxTemperatureAllowed: -2 .
	
	secondSpec := CTSanitaryForFoodSpecification new .
	
	conjSpec := firstSpec and: secondSpec .
	
	cargo specification: conjSpec .
	
	container workingTemperatureInterval: (-6 to: -3) isSanitaryForFood: true .
	self assert: (cargo canBePutInto: container ) .

	container workingTemperatureInterval: (-6 to: -3) isSanitaryForFood: false .	
	self deny: (cargo canBePutInto: container ) .

	container workingTemperatureInterval: (-6 to: -1) isSanitaryForFood: true .	
	self deny: (cargo canBePutInto: container ) .
	
	container workingTemperatureInterval: (-6 to: -1) isSanitaryForFood: false .	
	self deny: (cargo canBePutInto: container ) .
]

{ #category : #'using spec framework' }
CTCargoContainerTest >> testConjunctionOfTwoSpecificationsUsingDSL [

	| conjSpec |
	
	conjSpec := (CTSpecification attributeNamed: #isSanitaryForFood isEquals: true)
		and: (CTSpecification attributeNamed: #maxWorkingTemperature isLessThan: -1).
	cargo specification: conjSpec.
	
	container workingTemperatureInterval: (-6 to: -3) isSanitaryForFood: true.
	self assert: (cargo canBePutInto: container).
	
	container workingTemperatureInterval: (-6 to: -3) isSanitaryForFood: false.
	self deny: (cargo canBePutInto: container).
	
	container workingTemperatureInterval: (-6 to: -1) isSanitaryForFood: true.
	self deny: (cargo canBePutInto: container).
	
	container workingTemperatureInterval: (-6 to: -1) isSanitaryForFood: false.
	self deny: (cargo canBePutInto: container)
]

{ #category : #'composite specifications' }
CTCargoContainerTest >> testDisjunctionOfTwoSpecifications [

	|firstSpec secondSpec disjSpec|
	
	firstSpec := CTMaximumTemperatureSpecification new .
	firstSpec maxTemperatureAllowed: -2 .
	
	secondSpec := CTSanitaryForFoodSpecification new .
	
	disjSpec := firstSpec or: secondSpec .
	
	cargo specification: disjSpec .
	
	container workingTemperatureInterval: (-6 to: -3) isSanitaryForFood: true .
	self assert: (cargo canBePutInto: container ) .

	container workingTemperatureInterval: (-6 to: -3) isSanitaryForFood: false .	
	self assert: (cargo canBePutInto: container ) .

	container workingTemperatureInterval: (-6 to: -1) isSanitaryForFood: true .	
	self assert: (cargo canBePutInto: container ) .
	
	container workingTemperatureInterval: (-6 to: -1) isSanitaryForFood: false .	
	self deny: (cargo canBePutInto: container ) .
]

{ #category : #'composite specifications' }
CTCargoContainerTest >> testDisjunctionOfTwoSpecificationsUsingDSL [

	| disjSpec |
	
	disjSpec := (CTSpecification attributeNamed: #isSanitaryForFood isEquals: true)
		or: (CTSpecification attributeNamed: #maxWorkingTemperature isLessThan: -1).
	cargo specification: disjSpec.
	
	container workingTemperatureInterval: (-6 to: -3) isSanitaryForFood: true .
	self assert: (cargo canBePutInto: container ) .

	container workingTemperatureInterval: (-6 to: -3) isSanitaryForFood: false .	
	self assert: (cargo canBePutInto: container ) .

	container workingTemperatureInterval: (-6 to: -1) isSanitaryForFood: true .	
	self assert: (cargo canBePutInto: container ) .
	
	container workingTemperatureInterval: (-6 to: -1) isSanitaryForFood: false .	
	self deny: (cargo canBePutInto: container ) .
]

{ #category : #'using domain specifications' }
CTCargoContainerTest >> testIsSanitaryForFoodSpecificationSatisfied [
	| specification |
	specification := CTSanitaryForFoodSpecification new.
	cargo specification: specification.
	container workingTemperatureInterval: (-6 to: -3) isSanitaryForFood: true.
	self assert: (cargo canBePutInto: container).
	
	container workingTemperatureInterval: (-6 to: -3) isSanitaryForFood: false.
	self deny: (cargo canBePutInto: container).
]

{ #category : #'using domain specifications' }
CTCargoContainerTest >> testMaximumTemperatureSpecificationNotSatisfied [

	| specification |
	specification := CTMaximumTemperatureSpecification new .
	specification maxTemperatureAllowed: -2 .
	
	cargo specification: specification .
	container workingTemperatureInterval: (-3 to: 0) isSanitaryForFood: true .

	self deny: ( cargo canBePutInto: container ) .
]

{ #category : #'using domain specifications' }
CTCargoContainerTest >> testMaximumTemperatureSpecificationSatisfaction [

	| specification |
	specification := CTMaximumTemperatureSpecification new .
	specification maxTemperatureAllowed: -2 .
	
	cargo specification: specification .
	container workingTemperatureInterval: (-6 to: -3) isSanitaryForFood: true .

	self assert: ( cargo canBePutInto: container ) .
]
