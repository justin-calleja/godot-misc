@tool
class_name CrazyBtnsContext
extends Node

var src_btn_text_when_target_btn_enabled: String = "Press to disable other btn"
var src_btn_text_when_target_btn_disabled: String = "Press to enable other btn"
var src_btn_text_when_ready = src_btn_text_when_target_btn_enabled

@export var src_btn: Button:
	get:
		return src_btn
	set(node):
		src_btn = node
		update_configuration_warnings()

@export var src_btn_on_pressed_tree_root: TNode:
	get:
		return src_btn_on_pressed_tree_root
	set(node):
		src_btn_on_pressed_tree_root = node
		update_configuration_warnings()

@export var src_label: Label:
	get:
		return src_label
	set(node):
		src_label = node
		update_configuration_warnings()


@export var target_btn: Button:
	get:
		return target_btn
	set(node):
		target_btn = node
		update_configuration_warnings()

@export var target_btn_on_pressed_tree_root: TNode:
	get:
		return target_btn_on_pressed_tree_root
	set(node):
		target_btn_on_pressed_tree_root = node
		update_configuration_warnings()

@export var target_label: Label:
	get:
		return target_label
	set(node):
		target_label = node
		update_configuration_warnings()

var target_btn_press_count = 0

@export var num_of_target_btn_presses_to_switch: int = 3
var target_btn_fmt_text = "%s/%s to switch"

func _ready():
	if Engine.is_editor_hint():	return

	src_btn.text = src_btn_text_when_ready
	src_label.text = "0"
	update_target_btn_text()
	target_label.text = "0"
	
	src_btn.pressed.connect(on_src_btn_pressed)
	target_btn.pressed.connect(on_target_btn_pressed)

	_post_ready_assertions()


func toggle_src_btn_text() -> void:
	src_btn.text = src_btn_text_when_target_btn_disabled if target_btn.disabled else src_btn_text_when_target_btn_enabled


func toggle_target_btn_disabled() -> void:
	target_btn.disabled = not target_btn.disabled


func on_src_btn_pressed() -> void:
	src_btn_on_pressed_tree_root.traverseDF("on_src_btn_pressed", self)


func on_target_btn_pressed() -> void:
	target_btn_on_pressed_tree_root.traverseDF("on_target_btn_pressed", self)


func is_ok_to_switch() -> bool:
	return target_btn_press_count > 0 and target_btn_press_count % num_of_target_btn_presses_to_switch == 0


func switch_btns() -> void:
	if src_btn.pressed.is_connected(on_src_btn_pressed):
		src_btn.pressed.disconnect(on_src_btn_pressed)
	if target_btn.pressed.is_connected(on_target_btn_pressed):
		target_btn.pressed.disconnect(on_target_btn_pressed)
	
	var prev_src_btn = src_btn
	src_btn = target_btn
	target_btn = prev_src_btn
	
	src_btn.pressed.connect(on_src_btn_pressed)
	target_btn.pressed.connect(on_target_btn_pressed)
	
	var prev_src_label = src_label
	src_label = target_label
	target_label = prev_src_label
	
	src_btn.text = src_btn_text_when_ready
	update_target_btn_text()


func update_src_label_text() -> void:
	src_label.text = str(int(src_label.text) + 1)


func update_target_btn_text() -> void:
	target_btn.text = target_btn_fmt_text % [
		str(target_btn_press_count % num_of_target_btn_presses_to_switch),
		str(num_of_target_btn_presses_to_switch)
	]


func update_target_label_text() -> void:
	target_label.text = str(int(target_label.text) + 1)


func _post_ready_assertions() -> void:
	assert(is_instance_valid(src_btn), "src_btn is not valid")
	assert(is_instance_valid(src_btn_on_pressed_tree_root), "src_btn_on_pressed_tree_root is not valid")
	assert(is_instance_valid(src_label), "src_label is not valid")

	assert(is_instance_valid(target_btn), "target_btn is not valid")
	assert(is_instance_valid(target_btn_on_pressed_tree_root), "target_btn_on_pressed_tree_root is not valid")
	assert(is_instance_valid(target_label), "target_label is not valid")


func _get_configuration_warnings():
	var warnings = []

	if not is_instance_valid(src_btn):
		warnings.append("src_btn is not valid")
	if not is_instance_valid(src_btn_on_pressed_tree_root):
		warnings.append("src_btn_on_pressed_tree_root is not valid")
	if not is_instance_valid(src_label):
		warnings.append("src_label is not valid")

	if not is_instance_valid(target_btn):
		warnings.append("target_btn is not valid")
	if not is_instance_valid(target_btn_on_pressed_tree_root):
		warnings.append("target_btn_on_pressed_tree_root is not valid")
	if not is_instance_valid(target_label):
		warnings.append("target_label is not valid")

	return warnings
