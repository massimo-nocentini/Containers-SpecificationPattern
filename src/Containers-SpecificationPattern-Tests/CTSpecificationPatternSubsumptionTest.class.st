Class {
	#name : #CTSpecificationPatternSubsumptionTest,
	#superclass : #TestCase,
	#category : #'Containers-SpecificationPattern-Tests'
}

{ #category : #'as yet unclassified' }
CTSpecificationPatternSubsumptionTest >> testGeneralizationOfLessThanAndEqualSpecification [

	| general specific |
	
	general := CTSpecification attributeNamed: #maxWorkingTemperature isLessThan: -1 .
	specific := CTSpecification attributeNamed: #maxWorkingTemperature isEquals: -3 .
	
	self assert: (general isGeneralizationOf: specific) . 
	self deny: (specific isGeneralizationOf: general) . 
	
	general := CTSpecification attributeNamed: #maxWorkingTemperature isLessThan: -1 .
	specific := CTSpecification attributeNamed: #maxWorkingTemperature isEquals: -1 .
	
	self assert: (general isGeneralizationOf: specific) . 
	self deny: (specific isGeneralizationOf: general) . 
	
	general := CTSpecification attributeNamed: #maxWorkingTemperature isLessThan: -4 .
	specific := CTSpecification attributeNamed: #maxWorkingTemperature isEquals: -3 .
	
	self deny: (general isGeneralizationOf: specific) . 
	self deny: (specific isGeneralizationOf: general) . 
]

{ #category : #'as yet unclassified' }
CTSpecificationPatternSubsumptionTest >> testGeneralizationOfTwoEqualSpecification [

	| general specific |
	
	general := CTSpecification attributeNamed: #maxWorkingTemperature isEquals: -1 .
	specific := CTSpecification attributeNamed: #maxWorkingTemperature isEquals: -3 .
	
	self deny: (general isGeneralizationOf: specific) . 
	self deny: (specific isGeneralizationOf: general) . 
	
	general := CTSpecification attributeNamed: #maxWorkingTemperature isEquals: -1 .
	specific := CTSpecification attributeNamed: #maxWorkingTemperature isEquals: -1 .
	
	self assert: (general isGeneralizationOf: specific) . 
	self assert: (specific isGeneralizationOf: general) . 
	
	general := CTSpecification attributeNamed: #maxWorkingTemperature isEquals: -4 .
	specific := CTSpecification attributeNamed: #maxWorkingTemperature isEquals: -3 .
	
	self deny: (general isGeneralizationOf: specific) . 
	self deny: (specific isGeneralizationOf: general) . 
]

{ #category : #'as yet unclassified' }
CTSpecificationPatternSubsumptionTest >> testGeneralizationOfTwoLessThanSpecification [

	| general specific |
	
	general := CTSpecification attributeNamed: #maxWorkingTemperature isLessThan: -1 .
	specific := CTSpecification attributeNamed: #maxWorkingTemperature isLessThan: -3 .
	
	self assert: (general isGeneralizationOf: specific) . 
	self deny: (specific isGeneralizationOf: general) . 
	
	general := CTSpecification attributeNamed: #maxWorkingTemperature isLessThan: -1 .
	specific := CTSpecification attributeNamed: #maxWorkingTemperature isLessThan: -1 .
	
	self assert: (general isGeneralizationOf: specific) . 
	self assert: (specific isGeneralizationOf: general) . 
	
	general := CTSpecification attributeNamed: #maxWorkingTemperature isLessThan: -4 .
	specific := CTSpecification attributeNamed: #maxWorkingTemperature isLessThan: -3 .
	
	self deny: (general isGeneralizationOf: specific) . 
	self assert: (specific isGeneralizationOf: general) . 
]

{ #category : #'as yet unclassified' }
CTSpecificationPatternSubsumptionTest >> testSubsumptionForConjunctionSpecification [

	| a b conjSpec specificSpec nonSpecificSpec |
	
	a := CTSpecification attributeNamed: #isSanitaryForFood isEquals: true .
	b := CTSpecification attributeNamed: #maxWorkingTemperature isLessThan: -1 .
	
	conjSpec := a and: b .
	
	specificSpec := CTSpecification attributeNamed: #maxWorkingTemperature isLessThan: 10 .
	nonSpecificSpec := CTSpecification attributeNamed: #maxWorkingTemperature isLessThan: -1 .
	
	self assert: (conjSpec isSpecialCaseOf: a) .
	self assert: (conjSpec isSpecialCaseOf: b) .
	self assert: (conjSpec isSpecialCaseOf: specificSpec ) .
	self deny: (conjSpec isGeneralizationOf: nonSpecificSpec ) .
	
]

{ #category : #'as yet unclassified' }
CTSpecificationPatternSubsumptionTest >> testSubsumptionForDisjunctionSpecification [

	| a b disjSpec specificSpec nonSpecificSpec |
	
	a := CTSpecification attributeNamed: #isSanitaryForFood isEquals: true .
	b := CTSpecification attributeNamed: #maxWorkingTemperature isLessThan: -1 .
	
	disjSpec := a or: b .
	
	specificSpec := CTSpecification attributeNamed: #maxWorkingTemperature isLessThan: 10 .
	nonSpecificSpec := CTSpecification attributeNamed: #maxWorkingTemperature isLessThan: -3 .
	
	self assert: (disjSpec isGeneralizationOf: a) .
	self assert: (disjSpec isGeneralizationOf: b) .
	self deny: (specificSpec isSpecialCaseOf: disjSpec  ) .
	self assert: (disjSpec isGeneralizationOf: nonSpecificSpec ) . 
	
]
