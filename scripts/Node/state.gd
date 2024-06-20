class_name State
extends Node

var sm: StateMachine


func _ready() -> void:
	sm = get_parent()


# Receives events from the `_unhandled_input()` callback.
func unhandled_input_cb(_event: InputEvent) -> void:
	pass


# Corresponds to the `_process()` callback.
func process_cb(_delta: float) -> void:
	pass


# Corresponds to the `_physics_process()` callback.
func physics_process_cb(_delta: float) -> void:
	pass


func enter_lifecycle(_msg := {}) -> void:
	pass


func exit_lifecycle() -> void:
	pass


func transition_to(state_name: String, msg: Dictionary = {}) -> void:
	if sm.state.name == state_name:
		print("not transitioning to %s because already there" % state_name)
		return
	sm.transition_to(state_name, msg)

