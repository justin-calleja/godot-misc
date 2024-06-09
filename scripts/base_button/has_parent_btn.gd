class_name HasParentBtn
extends Node

var parent_btn: BaseButton:
	get:
		return parent_btn
	set(btn):
		parent_btn = btn

func _ready():
	parent_btn = get_parent()

