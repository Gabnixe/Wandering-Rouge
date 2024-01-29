extends Node2D

const tweenAnims = preload("res://utils/tweenAnims.gd")

var actionManager : ActionManager
var gameLoopManager : GameLoopManager
var consoleManager : ConsoleManager

func _ready():
	actionManager = get_node("/root/ActionManager")
	gameLoopManager = get_node("/root/GameLoopManager")
	consoleManager = get_node("/root/ConsoleManager")
	gameLoopManager.player = self
	actionManager.new_action.connect(_on_new_action)	


func _on_new_action(action : ActionManager.ActionType):
	if(action == ActionManager.ActionType.ACTION_UP_LEFT):
		move_player(Vector2.UP + Vector2.LEFT)
		consoleManager.sendMessage("Moved Up-Left")
	if(action == ActionManager.ActionType.ACTION_UP):
		move_player(Vector2.UP)
		consoleManager.sendMessage("Moved Up")
	if(action == ActionManager.ActionType.ACTION_UP_RIGHT):
		move_player(Vector2.UP + Vector2.RIGHT)
		consoleManager.sendMessage("Moved Up-Right")
	if(action == ActionManager.ActionType.ACTION_LEFT):
		move_player(Vector2.LEFT)
		consoleManager.sendMessage("Moved Left")
	if(action == ActionManager.ActionType.ACTION_RIGHT):
		move_player(Vector2.RIGHT)
		consoleManager.sendMessage("Moved Right")
	if(action == ActionManager.ActionType.ACTION_DOWN_LEFT):
		move_player(Vector2.DOWN + Vector2.LEFT)
		consoleManager.sendMessage("Moved Down-Left")
	if(action == ActionManager.ActionType.ACTION_DOWN):
		move_player(Vector2.DOWN)
		consoleManager.sendMessage("Moved Down")
	if(action == ActionManager.ActionType.ACTION_DOWN_RIGHT):
		move_player(Vector2.DOWN + Vector2.RIGHT)
		consoleManager.sendMessage("Moved Down-Right")
	if(action == ActionManager.ActionType.ACTION_WAIT):
		gameLoopManager.end_Step()

func move_player(direction : Vector2):
	var tile = get_node("/root/root/game/world/map").tileGrid[(position.x / 10) + direction.x][(position.y / 10) + direction.y]
	if(tile == 0):
		tweenAnims.playMoveTween(self,position, direction, gameLoopManager.end_Step)
	else:
		gameLoopManager.end_Step()
	
	
