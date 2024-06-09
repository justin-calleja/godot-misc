@tool
class_name HasBtnWithSfDisabled
extends Node


@export var btn_with_sf_disabled: BtnWithSfDisabled:
	get:
		return btn_with_sf_disabled
	set(btn):
		btn_with_sf_disabled = btn
		update_configuration_warnings()


func _ready():
	if Engine.is_editor_hint():
		return
	assert(is_instance_valid(btn_with_sf_disabled), "btn_with_sf_disabled is not valid")


func _get_configuration_warnings():
	var warnings = []

	if not is_instance_valid(btn_with_sf_disabled):
		warnings.append("btn_with_sf_disabled is not valid")

	return warnings

