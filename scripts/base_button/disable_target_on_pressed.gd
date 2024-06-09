class_name DisableTargetOnPressed
extends Node

@export var _target: BaseButton

var _parent: BaseButton


func _ready():
	_parent = get_parent()
	_parent.connect("pressed", _on_btn_pressed)


func _on_btn_pressed() -> void:
	if _target.disabled: enable(_target)
	else: disable(_target)


func disable(btn: BaseButton) -> void:
	btn.set_disabled(true)


func enable(btn: BaseButton) -> void:
	btn.set_disabled(false)
