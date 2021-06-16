Class {
	#name : #CargoContainerTest,
	#superclass : #TestCase,
	#instVars : [
		'cargo',
		'container'
	],
	#category : #'SpecificationPattern-Tests'
}

{ #category : #'as yet unclassified' }
CargoContainerTest >> setUp [ 
	cargo := Cargo new .
	container := Container new . 
]

{ #category : #'composite specifications' }
CargoContainerTest >> testConjunctionOfTwoSpecifications [

	|firstSpec secondSpec conjSpec|
	
	firstSpec := MaximumTemperatureSpecification new .
	firstSpec maxTemperatureAllowed: -2 .
	
	secondSpec := SanitaryForFoodSpecification new .
	
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
CargoContainerTest >> testConjunctionOfTwoSpecificationsUsingDSL [

	| conjSpec |
	
	conjSpec := (Specification attributeNamed: #isSanitaryForFood isEquals: true)
		and: (Specification attributeNamed: #maxWorkingTemperature isLessThan: -1).
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
CargoContainerTest >> testDisjunctionOfTwoSpecifications [

	|firstSpec secondSpec disjSpec|
	
	firstSpec := MaximumTemperatureSpecification new .
	firstSpec maxTemperatureAllowed: -2 .
	
	secondSpec := SanitaryForFoodSpecification new .
	
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
CargoContainerTest >> testDisjunctionOfTwoSpecificationsUsingDSL [

	| disjSpec |
	
	disjSpec := (Specification attributeNamed: #isSanitaryForFood isEquals: true)
		or: (Specification attributeNamed: #maxWorkingTemperature isLessThan: -1).
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
CargoContainerTest >> testIsSanitaryForFoodSpecificationSatisfied [
	| specification |
	specification := SanitaryForFoodSpecification new.
	cargo specification: specification.
	container workingTemperatureInterval: (-6 to: -3) isSanitaryForFood: true.
	self assert: (cargo canBePutInto: container).
	
	container workingTemperatureInterval: (-6 to: -3) isSanitaryForFood: false.
	self deny: (cargo canBePutInto: container).
]

{ #category : #'using domain specifications' }
CargoContainerTest >> testMaximumTemperatureSpecificationNotSatisfied [

	| specification |
	specification := MaximumTemperatureSpecification new .
	specification maxTemperatureAllowed: -2 .
	
	cargo specification: specification .
	container workingTemperatureInterval: (-3 to: 0) isSanitaryForFood: true .

	self deny: ( cargo canBePutInto: container ) .
]

{ #category : #'using domain specifications' }
CargoContainerTest >> testMaximumTemperatureSpecificationSatisfaction [

	| specification |
	specification := MaximumTemperatureSpecification new .
	specification maxTemperatureAllowed: -2 .
	
	cargo specification: specification .
	container workingTemperatureInterval: (-6 to: -3) isSanitaryForFood: true .

	self assert: ( cargo canBePutInto: container ) .
]
