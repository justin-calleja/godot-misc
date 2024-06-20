class_name ShowInProgress
extends DBoxState


func enter_lifecycle(msg := {}) -> void:
	dbox.tween_text(msg.text)
