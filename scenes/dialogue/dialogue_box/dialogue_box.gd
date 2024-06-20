class_name DialogueBox
extends CanvasLayer

@export_range(0.0, 1.0) var text_len_to_duration_multiplier = 0.03

@onready var text_label: Label = $MC/MC/HBoxContainer/Text
@onready var continue_label: Label = $MC/MC/HBoxContainer/Continue


func reset() -> void:
	text_label.text = ""
	continue_label.text = ""
	hide()


func show_text(text: String) -> void:
	text_label.text = text
	continue_label.text = "v"
	show()
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.set_ease(Tween.EASE_IN)
		
	tween.tween_property(
		text_label,
		"visible_ratio",
		1.0,
		len(text) * text_len_to_duration_multiplier
	).from(0.0)

