extends Node2D

@onready var _btn: Button = $ButtonLarge
@onready var _dbox_btn: Button = $DBoxBtn
@onready var dbox: DialogueBox = $DialogueBox

var _dialogue_line: DialogueLine
var _resource: Resource
var _is_done = false


func _ready() -> void:
	_resource = load("res://dialogue/tmp.dialogue")
	_btn.pressed.connect(_on_btn_pressed)
	_dbox_btn.pressed.connect(_on_dboc_btn_pressed)


func _get_next_dialogue_line() -> DialogueLine:
	return await _resource.get_next_dialogue_line(_dialogue_line.next_id if _dialogue_line else "this_is_a_node_title")


func _on_btn_pressed() -> void:
	if _is_done:
		print("already been through dialogue once...")
		return
	
	_dialogue_line = await _get_next_dialogue_line()
	
	if _dialogue_line == null:
		print("no more dialogue to print...")
		_is_done = true
		return

	print(_dialogue_line)


func _on_dboc_btn_pressed() -> void:
	_dialogue_line = await _get_next_dialogue_line()
	dbox.show_text(_dialogue_line.text)
