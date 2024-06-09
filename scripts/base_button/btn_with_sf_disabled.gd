class_name BtnWithSfDisabled
extends BaseButton

signal sf_disabled(state: bool)


func disable() -> void:
	set_disabled(true)
	sf_disabled.emit(true)


func enable() -> void:
	set_disabled(false)
	sf_disabled.emit(false)
