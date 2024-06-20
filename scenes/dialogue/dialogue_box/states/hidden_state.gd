class_name HiddenState
extends State

var dialogue_box: DialogueBox

func _ready() -> void:
	super._ready()
	dialogue_box = owner as DialogueBox
	assert(dialogue_box != null)


func enter_lifecycle(_msg := {}) -> void:
	dialogue_box.reset()
