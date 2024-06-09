@tool
class_name TargetBtn
extends Node

signal target_btn_disabled(state: bool)

@export var target_btn: BaseButton:
	get:
		return target_btn
	set(btn):
		target_btn = btn
		update_configuration_warnings()


func _ready():
	if Engine.is_editor_hint():
		return
	assert(is_instance_valid(target_btn), "target_btn is not valid. Have you assigned a BaseButton to it?")


func _get_configuration_warnings():
	var warnings = []

	if not is_instance_valid(target_btn):
		warnings.append("Please assign a ButtonBase to `target_btn`.")

	# Returning an empty array means "no warning".
	return warnings


func disable(btn: BaseButton) -> void:
	btn.set_disabled(true)
	target_btn_disabled.emit(true)


func enable(btn: BaseButton) -> void:
	btn.set_disabled(false)
	target_btn_disabled.emit(false)
