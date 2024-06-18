extends Node

signal selected(sprite2D)
var parent: Sprite2D

func _ready() -> void:
	parent = get_parent()


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if parent.get_rect().has_point(parent.to_local(event.position)):
			selected.emit(parent)
