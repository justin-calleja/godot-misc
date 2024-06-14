@tool
class_name SrcAndTargetBtns
extends Node

@export var src_btn: Button:
	get:
		return src_btn
	set(node):
		src_btn = node
		update_configuration_warnings()


@export var target_btn: Button:
	get:
		return target_btn
	set(node):
		target_btn = node
		update_configuration_warnings()


func _ready():
	if Engine.is_editor_hint():	return
	_post_ready_assertions()
	

func _post_ready_assertions() -> void:
	assert(is_instance_valid(src_btn), "src_btn is not valid")
	assert(is_instance_valid(target_btn), "target_btn is not valid")


func _get_configuration_warnings():
	var warnings = []

	if not is_instance_valid(src_btn):
		warnings.append("src_btn is not valid")
	if not is_instance_valid(target_btn):
		warnings.append("target_btn is not valid")

	return warnings
