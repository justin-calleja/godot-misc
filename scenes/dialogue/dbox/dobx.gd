class_name DBox
extends CanvasLayer

@onready var text_label: Label = $MC/MC/HBoxContainer/Text
@onready var continue_label: Label = $MC/MC/HBoxContainer/Continue
@onready var sm: StateMachine = $StateMachine

var _dresource: DialogueResource
#var _prev_dline: DialogueLine
var _dline: DialogueLine


func run_dialogue(dialogue_path: String, initial_dialogue_id: String) -> void:
	_load_dresource(dialogue_path)
	_dline = await DialogueManager.get_next_dialogue_line(
		_dresource,
		initial_dialogue_id
	)
	try_show_dialogue_line()


func try_show_dialogue_line() -> void:
	if can_show_dialogue_line():
		sm.transition_to(&"ShowInProgress", { "text": get_current_dialogue_line_text() })
		return
	sm.transition_to(&"End")


func advance_dialogue_line() -> void:
	if sm.state.name == &"End":
		return
	
	_dline = await DialogueManager.get_next_dialogue_line(
		_dresource,
		_dline.next_id
	)


func can_show_dialogue_line() -> bool:
	return _dline != null


func get_current_dialogue_line_text() -> String:
	return _dline.text


func _load_dresource(dialogue_path: String = &"res://dialogue/tmp.dialogue")-> void:
	_dresource = load(dialogue_path)

