class_name DBoxState
extends State

var dbox: DBox

func _ready() -> void:
	super._ready()
	dbox = owner as DBox
	assert(dbox != null)
