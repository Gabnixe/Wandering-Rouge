extends Node

var inputManager : InputManager

func _ready():
	inputManager = get_node("/root/InputManager")
	
func endStep():
	inputManager.isWaitingForInput = true;
