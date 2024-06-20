# class_name ShowComplete
extends DBoxState

var offset = 5.0
var tween: Tween

func unhandled_input_cb(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE or event.keycode == KEY_ENTER or event.keycode == KEY_KP_ENTER:
			dbox.try_show_dialogue_line()


func enter_lifecycle(msg := {}) -> void:
	dbox.advance_dialogue_line()

	if not dbox.can_show_dialogue_line():
		dbox.continue_label.text = "*"
		return
	
	dbox.continue_label.text = "V"

	tween = create_tween().set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_IN_OUT).set_loops()
	tween.tween_property(
		dbox.continue_label,
		"position:y",
		dbox.continue_label.position.y - offset,
		0.5
	).from(dbox.continue_label.position.y)
	tween.tween_property(
		dbox.continue_label,
		"position",
		dbox.continue_label.position.y + offset,
		0.5
	)


func exit_lifecycle() -> void:
	if tween:
		tween.kill()
