extends Node

var parent_btn: BaseButton:
	get:
		return parent_btn
	set(btn):
		parent_btn = btn

func _ready():
	parent_btn = get_parent()
	for child in get_children():
		if child.has_method("on_pressed"):
			parent_btn.pressed.connect(child.on_pressed.bind(parent_btn))

