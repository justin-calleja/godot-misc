class_name State
extends Node

var parent: StateMachine


func _ready() -> void:
	parent = get_parent()


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
	parent.transition_to(state_name, msg)

