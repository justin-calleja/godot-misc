@tool
extends HasBtnWithSfDisabled


func toggle_target_btn_disabled() -> void:
	if btn_with_sf_disabled.disabled:
		btn_with_sf_disabled.enable()
	else:
		btn_with_sf_disabled.disable()
