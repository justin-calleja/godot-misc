class_name StateMachine
extends Node

signal transitioned(state_name: String, prev_state_name: String)

@export var initial_state: State

var state: State

func _ready() -> void:
	await owner.ready
	state = initial_state
	assert(is_instance_valid(state))
	state.enter_lifecycle()


# The state machine subscribes to node callbacks and delegates them to the state objects.
func _unhandled_input(event: InputEvent) -> void:
	state.unhandled_input_cb(event)


func _process(delta: float) -> void:
	state.process_cb(delta)


func _physics_process(delta: float) -> void:
	state.physics_process_cb(delta)


func transition_to(state_name: String, msg: Dictionary = {}) -> void:
	var new_state = get_node(state_name)
	
	if not new_state:
		printerr("state machine has no state named '%s'" % state_name)
		return
	
	var prev_state_name = state.name
	state.exit_lifecycle()
	state = new_state
	state.enter_lifecycle(msg)
	# NOTE: you probably don't need to emit the msg state was entered with
	transitioned.emit(state.name, prev_state_name)
