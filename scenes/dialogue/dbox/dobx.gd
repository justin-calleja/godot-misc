class_name DBox
extends CanvasLayer

@export_range(0.0, 1.0) var text_len_to_duration_multiplier = 0.03

@onready var text_label: Label = $MC/MC/HBoxContainer/Text
@onready var continue_label: Label = $MC/MC/HBoxContainer/Continue
@onready var sm: StateMachine = $StateMachine

var _dresource: DialogueResource
var _next_dline: DialogueLine

func run_dialogue(dialogue_path: String, initial_dialogue_id: String) -> void:
	_next_dline = await DialogueManager.get_next_dialogue_line(
		_load_dresource(dialogue_path),
		_next_dline.next_id if _next_dline else initial_dialogue_id
	)
	
	if _next_dline == null:
		sm.transition_to("End")
		return
	
	sm.transition_to("ShowInProgress", { "text": _next_dline.text })
	

func _load_dresource(dialogue_path: String = "res://dialogue/tmp.dialogue")-> DialogueResource:
	_dresource = load(dialogue_path)
	return _dresource


func reset() -> void:
	text_label.text = ""
	continue_label.text = ""
	hide()


func tween_text(text: String) -> void:
	text_label.text = text

	var tween = create_tween()
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.set_ease(Tween.EASE_IN)
	tween.tween_property(
		text_label,
		"visible_ratio",
		1.0,
		len(text) * text_len_to_duration_multiplier
	).from(0.0)

	show()
