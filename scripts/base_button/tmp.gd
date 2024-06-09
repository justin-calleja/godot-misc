class_name Abc
extends DisableTargetOnPressed

@export var text_when_target_is_enabled: String
@export var text_when_target_is_disabled: String
@export var set_parent_text_on_ready: bool = true

func _ready():
	super()
	if set_parent_text_on_ready:
		_parent.text = text_when_target_is_enabled

func disable(btn: BaseButton) -> void:
	super(btn)
	_parent.text = text_when_target_is_disabled

func enable(btn: BaseButton) -> void:
	super(btn)
	_parent.text = text_when_target_is_enabled
