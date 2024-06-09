@tool
extends TargetBtn


func on_pressed(_pressed_btn: BaseButton) -> void:
	if target_btn.disabled: enable(target_btn)
	else: disable(target_btn)

