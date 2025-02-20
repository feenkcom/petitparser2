"
Default strategy for PP2LiteralSequenceNode.
"
Class {
	#name : #PP2LiteralSequence,
	#superclass : #PP2Strategy,
	#category : #'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2LiteralSequence >> parseOn: aPP2Context [
	| position |
	position := aPP2Context rememberPosition.
	(node literal sameContentAs: (aPP2Context next: node size))
		ifTrue: [ ^ node literal ].
	aPP2Context restorePosition: position.
	^ PP2Failure message: 'literal not found' context: aPP2Context
]
