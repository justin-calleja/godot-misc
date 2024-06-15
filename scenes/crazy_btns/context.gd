@tool
class_name CrazyBtnsContext
extends Node

@export var src_btn: Button:
	get:
		return src_btn
	set(node):
		src_btn = node
		update_configuration_warnings()

@export var src_label: Label:
	get:
		return src_label
	set(node):
		src_label = node
		update_configuration_warnings()

var src_btn_press_count: int = 0

@export var target_btn: Button:
	get:
		return target_btn
	set(node):
		target_btn = node
		update_configuration_warnings()

@export var target_label: Label:
	get:
		return target_label
	set(node):
		target_label = node
		update_configuration_warnings()

var target_btn_press_count = 0

func _ready():
	if Engine.is_editor_hint():	return
	_post_ready_assertions()
	

func _post_ready_assertions() -> void:
	assert(is_instance_valid(src_btn), "src_btn is not valid")
	assert(is_instance_valid(src_label), "src_label is not valid")

	assert(is_instance_valid(target_btn), "target_btn is not valid")
	assert(is_instance_valid(target_label), "target_label is not valid")


func _get_configuration_warnings():
	var warnings = []

	if not is_instance_valid(src_btn):
		warnings.append("src_btn is not valid")
	if not is_instance_valid(src_label):
		warnings.append("src_label is not valid")

	if not is_instance_valid(target_btn):
		warnings.append("target_btn is not valid")
	if not is_instance_valid(target_label):
		warnings.append("target_label is not valid")

	return warnings
