Class {
	#name : #SubsumptionTest,
	#superclass : #TestCase,
	#category : #'SpecificationPattern-Tests'
}

{ #category : #'as yet unclassified' }
SubsumptionTest >> testGeneralizationOfLessThanAndEqualSpecification [

	| general specific |
	
	general := Specification attributeNamed: #maxWorkingTemperature isLessThan: -1 .
	specific := Specification attributeNamed: #maxWorkingTemperature isEquals: -3 .
	
	self assert: (general isGeneralizationOf: specific) . 
	self deny: (specific isGeneralizationOf: general) . 
	
	general := Specification attributeNamed: #maxWorkingTemperature isLessThan: -1 .
	specific := Specification attributeNamed: #maxWorkingTemperature isEquals: -1 .
	
	self assert: (general isGeneralizationOf: specific) . 
	self deny: (specific isGeneralizationOf: general) . 
	
	general := Specification attributeNamed: #maxWorkingTemperature isLessThan: -4 .
	specific := Specification attributeNamed: #maxWorkingTemperature isEquals: -3 .
	
	self deny: (general isGeneralizationOf: specific) . 
	self deny: (specific isGeneralizationOf: general) . 
]

{ #category : #'as yet unclassified' }
SubsumptionTest >> testGeneralizationOfTwoEqualSpecification [

	| general specific |
	
	general := Specification attributeNamed: #maxWorkingTemperature isEquals: -1 .
	specific := Specification attributeNamed: #maxWorkingTemperature isEquals: -3 .
	
	self deny: (general isGeneralizationOf: specific) . 
	self deny: (specific isGeneralizationOf: general) . 
	
	general := Specification attributeNamed: #maxWorkingTemperature isEquals: -1 .
	specific := Specification attributeNamed: #maxWorkingTemperature isEquals: -1 .
	
	self assert: (general isGeneralizationOf: specific) . 
	self assert: (specific isGeneralizationOf: general) . 
	
	general := Specification attributeNamed: #maxWorkingTemperature isEquals: -4 .
	specific := Specification attributeNamed: #maxWorkingTemperature isEquals: -3 .
	
	self deny: (general isGeneralizationOf: specific) . 
	self deny: (specific isGeneralizationOf: general) . 
]

{ #category : #'as yet unclassified' }
SubsumptionTest >> testGeneralizationOfTwoLessThanSpecification [

	| general specific |
	
	general := Specification attributeNamed: #maxWorkingTemperature isLessThan: -1 .
	specific := Specification attributeNamed: #maxWorkingTemperature isLessThan: -3 .
	
	self assert: (general isGeneralizationOf: specific) . 
	self deny: (specific isGeneralizationOf: general) . 
	
	general := Specification attributeNamed: #maxWorkingTemperature isLessThan: -1 .
	specific := Specification attributeNamed: #maxWorkingTemperature isLessThan: -1 .
	
	self assert: (general isGeneralizationOf: specific) . 
	self assert: (specific isGeneralizationOf: general) . 
	
	general := Specification attributeNamed: #maxWorkingTemperature isLessThan: -4 .
	specific := Specification attributeNamed: #maxWorkingTemperature isLessThan: -3 .
	
	self deny: (general isGeneralizationOf: specific) . 
	self assert: (specific isGeneralizationOf: general) . 
]

{ #category : #'as yet unclassified' }
SubsumptionTest >> testSubsumptionForConjunctionSpecification [

	| a b conjSpec specificSpec nonSpecificSpec |
	
	a := Specification attributeNamed: #isSanitaryForFood isEquals: true .
	b := Specification attributeNamed: #maxWorkingTemperature isLessThan: -1 .
	
	conjSpec := a and: b .
	
	specificSpec := Specification attributeNamed: #maxWorkingTemperature isLessThan: 10 .
	nonSpecificSpec := Specification attributeNamed: #maxWorkingTemperature isLessThan: -1 .
	
	self assert: (conjSpec isSpecialCaseOf: a) .
	self assert: (conjSpec isSpecialCaseOf: b) .
	self assert: (conjSpec isSpecialCaseOf: specificSpec ) .
	self deny: (conjSpec isGeneralizationOf: nonSpecificSpec ) .
	
]

{ #category : #'as yet unclassified' }
SubsumptionTest >> testSubsumptionForDisjunctionSpecification [

	| a b disjSpec specificSpec nonSpecificSpec |
	
	a := Specification attributeNamed: #isSanitaryForFood isEquals: true .
	b := Specification attributeNamed: #maxWorkingTemperature isLessThan: -1 .
	
	disjSpec := a or: b .
	
	specificSpec := Specification attributeNamed: #maxWorkingTemperature isLessThan: 10 .
	nonSpecificSpec := Specification attributeNamed: #maxWorkingTemperature isLessThan: -3 .
	
	self assert: (disjSpec isGeneralizationOf: a) .
	self assert: (disjSpec isGeneralizationOf: b) .
	self deny: (specificSpec isSpecialCaseOf: disjSpec  ) .
	self assert: (disjSpec isGeneralizationOf: nonSpecificSpec ) . 
	
]
