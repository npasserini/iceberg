"
I register Iceberg projects.
I will open a dialog to take the new possible repository (from available options) and I will register it into the IceRepository>>#registry list.
"
Class {
	#name : #IceTipAddRepositoryCommand,
	#superclass : #IceTipRepositoryCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipAddRepositoryCommand class >> defaultDescription [

	^ 'Add a repository (new, local, cloned) to your managed repositories.'
]

{ #category : #accessing }
IceTipAddRepositoryCommand class >> defaultName [

	^ 'Add'
]

{ #category : #testing }
IceTipAddRepositoryCommand >> canBeExecuted [ 
	
	"This command can be executed with our without selection"
	^ true
]

{ #category : #execution }
IceTipAddRepositoryCommand >> execute [

	IceTipRegisterRepositoryDialog new openDialogWithSpec
]

{ #category : #accessing }
IceTipAddRepositoryCommand >> iconName [

	^ #add
]

{ #category : #accessing }
IceTipAddRepositoryCommand >> shortcutKey [

	^ $n meta
]

{ #category : #testing }
IceTipAddRepositoryCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
