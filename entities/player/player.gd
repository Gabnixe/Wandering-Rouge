extends Node2D

const tweenAnims = preload("res://utils/tweenAnims.gd")

var inputManager : InputManager
var gameLoopManager : GameLoopManager

func _ready():
	inputManager = get_node("/root/InputManager")
	gameLoopManager = get_node("/root/GameLoopManager")
	inputManager.input_received.connect(_on_input_received)

func _on_input_received(input : InputManager.InputType):
	inputManager.isWaitingForInput = false;
	if(input == InputManager.InputType.DOWN):
		tweenAnims.playMoveTween(self,position, Vector2.DOWN, gameLoopManager.endStep)
	if(input == InputManager.InputType.UP):
		tweenAnims.playMoveTween(self,position, Vector2.UP, gameLoopManager.endStep)
	if(input == InputManager.InputType.LEFT):
		tweenAnims.playMoveTween(self,position, Vector2.LEFT, gameLoopManager.endStep)
	if(input == InputManager.InputType.RIGHT):
		tweenAnims.playMoveTween(self,position, Vector2.RIGHT, gameLoopManager.endStep)
