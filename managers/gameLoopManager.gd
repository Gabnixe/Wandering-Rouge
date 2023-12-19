extends Node

var inputManager : InputManager

var player
var camera: Camera2D

func _ready():
	inputManager = get_node("/root/InputManager")

func endStep():
	inputManager.isWaitingForInput = true;
