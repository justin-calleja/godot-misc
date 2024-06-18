class_name ResizeableSelect
extends Sprite2D

@export var delta_scale_for_tween = 0.6
@export var half_tween_duration = 0.4

var width = 32
var height = 32
var parent: Sprite2D


func _ready() -> void:
	parent = get_parent() as Sprite2D
	var parent_size = parent.get_rect().size
	scale_to_fit(parent_size)
	visible = true
	
	var tween = create_tween().set_loops().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
		
	tween.tween_property(self, "scale", scale + Vector2(delta_scale_for_tween, delta_scale_for_tween), half_tween_duration)
	tween.tween_property(self, "scale", scale, half_tween_duration)


func scale_to_fit(size: Vector2) -> void:
	var scale_x = size.x / width
	var scale_y = size.y / height
	var new_scale = max(scale_x, scale_y)
	set_scale(Vector2(new_scale + delta_scale_for_tween, new_scale + delta_scale_for_tween))
	
