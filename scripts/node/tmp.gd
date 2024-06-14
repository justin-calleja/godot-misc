extends Node

var _src_btn_text_when_enabled = "Press to disable ->"
var _src_btn_text_when_disabled = "Press to disable ->"
var _src_btn_text_when_ready = _src_btn_text_when_enabled

var _parent: SrcAndTargetBtns


func _ready():
	_parent= get_parent()
	assert(_parent is SrcAndTargetBtns)
	_parent.src_btn.pressed.connect(on_src_pressed)
	_parent.src_btn.text = _src_btn_text_when_ready


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_src_pressed():
	var is_target_btn_disabled = _parent.target_btn.disabled
	toggle_target_btn_disabled_state(is_target_btn_disabled)
	toggle_src_btn_text(is_target_btn_disabled)


func toggle_target_btn_disabled_state(is_target_btn_disabled: bool) -> void:
	_parent.target_btn.disabled = false if is_target_btn_disabled else true


func toggle_src_btn_text(is_target_btn_disabled) -> void:
	_parent.src_btn.text = _src_btn_text_when_enabled if is_target_btn_disabled else _src_btn_text_when_disabled
