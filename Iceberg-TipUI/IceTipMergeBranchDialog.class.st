"
I'm a dialog to perform a merge of a branch.

(self onRepository: IceRepository registry anyOne) openDialogWithSpec
"
Class {
	#name : #IceTipMergeBranchDialog,
	#superclass : #IceTipOptionDialog,
	#instVars : [
		'model',
		'types'
	],
	#category : #'Iceberg-TipUI-View-Branch'
}

{ #category : #'instance creation' }
IceTipMergeBranchDialog class >> onRepository: aRepository [

	^ self on: (IceTipRepositoryModel on: aRepository) beCached
]

{ #category : #accessing }
IceTipMergeBranchDialog >> allTypes [

	^ types ifNil: [ types := self createMergeBranchTypes ]
]

{ #category : #accessing }
IceTipMergeBranchDialog >> beSwitchAndMerge [

	self allTypes do: #beSwitchAndMerge
]

{ #category : #'private factory' }
IceTipMergeBranchDialog >> createMergeBranchTypes [

	| allTypes |
	"Collect types local+remotes"	
	allTypes :=  { 
	 	(IceTipMergeBranchPanel on: self model) 
			titleForWindow: 'Local';
			withoutHead;
			icon: (self iconNamed: #branch);
			yourself }, 
	(self model remoteModels collect: [ :each | 
		(IceTipMergeBranchPanel on: each)
			titleForWindow: each name;
			icon: (self iconNamed: #remote);
			yourself ]).
	
	"Doing this because I can trigger the accept inside the panels."
	allTypes do: [ :each | each onAccept: [ self closeWindow ] ].
	
	^ allTypes
]

{ #category : #actions }
IceTipMergeBranchDialog >> doAccept [

	self selectedType doAccept
]

{ #category : #initialization }
IceTipMergeBranchDialog >> initialExtentForWindow [

	^ (600 @ 400) scaledByDisplayScaleFactor
]

{ #category : #accessing }
IceTipMergeBranchDialog >> model [

	^ model
]

{ #category : #accessing }
IceTipMergeBranchDialog >> model: anObject [

	model := anObject.
	self allTypes do: [ :each | each model: anObject ]
]

{ #category : #'model access' }
IceTipMergeBranchDialog >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : #initialization }
IceTipMergeBranchDialog >> titleForWindow [

	^ 'Select branch to merge into ' , self model branchName
]
