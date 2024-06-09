@tool
class_name HasBtn
extends Node


@export var btn: Button:
	get:
		return btn
	set(new_btn):
		btn = new_btn
		update_configuration_warnings()


func _ready():
	if Engine.is_editor_hint():
		return
	assert(is_instance_valid(btn), "btn is not valid")


func _get_configuration_warnings():
	var warnings = []

	if not is_instance_valid(btn):
		warnings.append("btn is not valid")

	return warnings

