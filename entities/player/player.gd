extends Node2D

const tweenAnims = preload("res://utils/tweenAnims.gd")

var inputManager : InputManager
var gameLoopManager : GameLoopManager

func _ready():
	inputManager = get_node("/root/InputManager")
	gameLoopManager = get_node("/root/GameLoopManager")
	gameLoopManager.player = self
	inputManager.input_received.connect(_on_input_received)

func _on_input_received(input : InputManager.InputType):
	inputManager.isWaitingForInput = false;
	if(input == InputManager.InputType.ACTION_UP_LEFT):
		move_player(Vector2.UP + Vector2.LEFT)
	if(input == InputManager.InputType.ACTION_UP):
		move_player(Vector2.UP)
	if(input == InputManager.InputType.ACTION_UP_RIGHT):
		move_player(Vector2.UP + Vector2.RIGHT)
	if(input == InputManager.InputType.ACTION_LEFT):
		move_player(Vector2.LEFT)
	if(input == InputManager.InputType.ACTION_RIGHT):
		move_player(Vector2.RIGHT)
	if(input == InputManager.InputType.ACTION_DOWN_LEFT):
		move_player(Vector2.DOWN + Vector2.LEFT)
	if(input == InputManager.InputType.ACTION_DOWN):
		move_player(Vector2.DOWN)
	if(input == InputManager.InputType.ACTION_DOWN_RIGHT):
		move_player(Vector2.DOWN + Vector2.RIGHT)

func move_player(direction : Vector2):
	tweenAnims.playMoveTween(self,position, direction, gameLoopManager.endStep)
	gameLoopManager.camera.moveCamera(direction)
