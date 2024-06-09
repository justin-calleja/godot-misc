extends Node

#var parent: TargetBtn:
	#get:
		#return parent
	#set(node):
		#parent = node
#
#func _ready():
	#parent = get_parent()
	#for child in get_children():
		#if child.has_method("on_pressed"):
			#parent_btn.pressed.connect(child.on_pressed.bind(parent_btn))
#
#


#signal target_btn_disabled(state: bool)
#
#
#func on_pressed(_pressed_btn: BaseButton) -> void:
	#if target_btn.disabled: enable(target_btn)
	#else: disable(target_btn)
#
#
#func disable(btn: BaseButton) -> void:
	#
	#target_btn_disabled.emit(true)
#
#
#func enable(btn: BaseButton) -> void:
	#btn.set_disabled(false)
	##target_btn_disabled.emit(false)
