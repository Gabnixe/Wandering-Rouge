extends Node2D

const tweenAnims = preload("res://utils/tweenAnims.gd")

var inputManager : InputManager
var gameLoopManager : GameLoopManager
var consoleManager : ConsoleManager

func _ready():
	inputManager = get_node("/root/InputManager")
	gameLoopManager = get_node("/root/GameLoopManager")
	consoleManager = get_node("/root/ConsoleManager")
	gameLoopManager.player = self
	inputManager.input_received.connect(_on_input_received)
	


func _on_input_received(input : InputManager.InputType):
	inputManager.isWaitingForInput = false;
	if(input == InputManager.InputType.ACTION_UP_LEFT):
		move_player(Vector2.UP + Vector2.LEFT)
		consoleManager.sendMessage("Moved Up-Left")
	if(input == InputManager.InputType.ACTION_UP):
		move_player(Vector2.UP)
		consoleManager.sendMessage("Moved Up")
	if(input == InputManager.InputType.ACTION_UP_RIGHT):
		move_player(Vector2.UP + Vector2.RIGHT)
		consoleManager.sendMessage("Moved Up-Right")
	if(input == InputManager.InputType.ACTION_LEFT):
		move_player(Vector2.LEFT)
		consoleManager.sendMessage("Moved Left")
	if(input == InputManager.InputType.ACTION_RIGHT):
		move_player(Vector2.RIGHT)
		consoleManager.sendMessage("Moved Right")
	if(input == InputManager.InputType.ACTION_DOWN_LEFT):
		move_player(Vector2.DOWN + Vector2.LEFT)
		consoleManager.sendMessage("Moved Down-Left")
	if(input == InputManager.InputType.ACTION_DOWN):
		move_player(Vector2.DOWN)
		consoleManager.sendMessage("Moved Down")
	if(input == InputManager.InputType.ACTION_DOWN_RIGHT):
		move_player(Vector2.DOWN + Vector2.RIGHT)
		consoleManager.sendMessage("Moved Down-Right")
	if(input == InputManager.InputType.ACTION_WAIT):
		gameLoopManager.endStep()

func move_player(direction : Vector2):
	tweenAnims.playMoveTween(self,position, direction, gameLoopManager.endStep)
	gameLoopManager.camera.moveCamera(direction)
