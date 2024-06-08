extends Node

@export var _label_node: Label
@export var _label_text: String


func _ready():
	_label_node.text = _label_text

