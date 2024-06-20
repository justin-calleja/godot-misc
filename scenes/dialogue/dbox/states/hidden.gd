# class_name HiddenState
extends DBoxState


func enter_lifecycle(_msg := {}) -> void:
	dbox.text_label.text = ""
	dbox.continue_label.text = ""
	dbox.hide()

