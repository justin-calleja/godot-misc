extends Node2D

var resizeable_select_resource: PackedScene = preload("res://scenes/select/resizeable_select/resizeable_select.tscn")
var selected_sprite: Sprite2D = null

func _on_sprite2D_selected(sprite2D: Sprite2D) -> void:
	if selected_sprite == sprite2D:
		return
	
	if selected_sprite:
		remove_resizeable_select_from(selected_sprite)
	var resizeable_select = resizeable_select_resource.instantiate()
	sprite2D.add_child(resizeable_select)
	selected_sprite = sprite2D
	

func remove_resizeable_select_from(sprite: Sprite2D):
	for child in sprite.get_children():
		print(child.name)
	var resizeable_select = sprite.find_child("ResizeableSelect", false, false)
	if resizeable_select:
		resizeable_select.queue_free()
