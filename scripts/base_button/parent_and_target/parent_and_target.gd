class_name ParentAndTarget
extends Node

@export var target_btn: BaseButton:
	get:
		return target_btn
	set(btn):
		target_btn = btn

var parent_btn: BaseButton:
	get:
		return parent_btn
	set(btn):
		parent_btn = btn

func _ready():
	parent_btn = get_parent()

