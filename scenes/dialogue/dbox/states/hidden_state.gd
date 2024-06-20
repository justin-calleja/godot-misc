class_name HiddenState
extends DBoxState

func enter_lifecycle(_msg := {}) -> void:
	dbox.reset()
