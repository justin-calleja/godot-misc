extends Sprite2D

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var tween = create_tween() # .set_loops()
		tween.set_trans(Tween.TRANS_BACK)
		tween.set_ease(Tween.EASE_IN)
		
		tween.tween_property(material, "shader_parameter/line_thickness", 4.0, 0.4).from(1.0)
		tween.tween_property(material, "shader_parameter/line_thickness", 1.0, 0.4)


