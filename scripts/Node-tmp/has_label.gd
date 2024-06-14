@tool
class_name HasLabel
extends Node


@export var label: Label:
	get:
		return label
	set(node):
		label = node
		update_configuration_warnings()


func _ready():
	if Engine.is_editor_hint():
		return
	assert(is_instance_valid(label), "label is not valid")


func _get_configuration_warnings():
	var warnings = []

	if not is_instance_valid(label):
		warnings.append("label is not valid")

	return warnings

