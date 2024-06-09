@tool
extends HasBtn

@export var text_when_enabled: String
@export var text_when_disabled: String
@export var text_when_ready: String


func _ready():
	super()
	if not text_when_ready.is_empty():
		btn.text = text_when_ready


func on_disabled_change(is_disabled: bool) -> void:
	btn.text = text_when_disabled if is_disabled else text_when_enabled

