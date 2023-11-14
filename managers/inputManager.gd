extends Node

var isWaitingForInput : bool = true

signal input_received( input )

enum InputType {UP, DOWN, LEFT, RIGHT}

func _process(_delta):
	if(isWaitingForInput):
		if Input.is_action_pressed("PlayerLeft"):
			input_received.emit(InputType.LEFT)
		elif Input.is_action_pressed("PlayerRight"):
			input_received.emit(InputType.RIGHT)
		elif Input.is_action_pressed("PlayerUp"):
			input_received.emit(InputType.UP)
		elif Input.is_action_pressed("PlayerDown"):
			input_received.emit(InputType.DOWN)
