extends Node

var isWaitingForInput : bool = true

signal input_received( input )

enum InputType {ACTION_UP_LEFT, ACTION_UP, ACTION_UP_RIGHT, ACTION_LEFT, ACTION_RIGHT, ACTION_DOWN_LEFT, ACTION_DOWN, ACTION_DOWN_RIGHT, ACTION_WAIT}

func _process(_delta):
	if(isWaitingForInput):
		if Input.is_action_pressed("PlayerLeft"):
			input_received.emit(InputType.ACTION_LEFT)
		elif Input.is_action_pressed("PlayerRight"):
			input_received.emit(InputType.ACTION_RIGHT)
		elif Input.is_action_pressed("PlayerUp"):
			input_received.emit(InputType.ACTION_UP)
		elif Input.is_action_pressed("PlayerDown"):
			input_received.emit(InputType.ACTION_DOWN)

func sendInput(input : InputType):
	input_received.emit(input)
