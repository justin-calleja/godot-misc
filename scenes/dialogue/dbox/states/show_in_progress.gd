# class_name ShowInProgress
extends DBoxState

@export_range(0.0, 1.0) var text_len_to_duration_multiplier = 0.03

var tween: Tween

func unhandled_input_cb(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE or event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
			dbox.text_label.visible_ratio = 1.0
			transition_to(&"ShowComplete")


func enter_lifecycle(msg := {}) -> void:
	dbox.continue_label.text = ""
	dbox.text_label.text = msg.text
	dbox.text_label.visible_ratio = 0.0
	dbox.show()

	tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween.tween_property(
		dbox.text_label,
		"visible_ratio",
		1.0,
		len(msg.text) * text_len_to_duration_multiplier
	)
	await tween.finished

	transition_to(&"ShowComplete")


func exit_lifecycle() -> void:
	if tween:
		tween.kill()

