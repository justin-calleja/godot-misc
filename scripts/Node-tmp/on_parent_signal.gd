@tool
class_name OnParentSignal
extends Node

@export var callback_name: String = "":
	get:
		return callback_name
	set(name):
		callback_name = name
		update_configuration_warnings()

@export var signal_name: String = "":
	get:
		return signal_name
	set(name):
		signal_name = name
		update_configuration_warnings()


var parent: Node:
	get:
		return parent
	set(node):
		parent = node

func _ready():
	if Engine.is_editor_hint():	return
	
	assert(not callback_name.is_empty(), "Missing callback_name")
	assert(not signal_name.is_empty(), "Missing signal_name")

	parent= get_parent()
	for child in get_children():
		var callback = child.get(callback_name)
		if callback != null:
			parent.get(signal_name).connect(callback)


func _get_configuration_warnings():
	var warnings = []

	if callback_name.is_empty():
		warnings.append("Missing callback_name")
	if signal_name.is_empty():
		warnings.append("Missing signal_name")

	return warnings
