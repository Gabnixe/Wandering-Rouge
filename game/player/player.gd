extends Node2D

var actionManager : ActionManager
var gameLoopManager : GameLoopManager
var consoleManager : ConsoleManager

var map : Map

func _ready():
	actionManager = get_node("/root/ActionManager")
	gameLoopManager = get_node("/root/GameLoopManager")
	consoleManager = get_node("/root/ConsoleManager")
	gameLoopManager.player = self
	actionManager.new_action.connect(_on_new_action)	


func _on_new_action(action : ActionManager.ActionType):
	if(action == ActionManager.ActionType.ACTION_UP_LEFT):
		move_player(Vector2i.UP + Vector2i.LEFT)
		consoleManager.sendMessage("Moved Up-Left")
	if(action == ActionManager.ActionType.ACTION_UP):
		move_player(Vector2i.UP)
		consoleManager.sendMessage("Moved Up")
	if(action == ActionManager.ActionType.ACTION_UP_RIGHT):
		move_player(Vector2i.UP + Vector2i.RIGHT)
		consoleManager.sendMessage("Moved Up-Right")
	if(action == ActionManager.ActionType.ACTION_LEFT):
		move_player(Vector2i.LEFT)
		consoleManager.sendMessage("Moved Left")
	if(action == ActionManager.ActionType.ACTION_RIGHT):
		move_player(Vector2i.RIGHT)
		consoleManager.sendMessage("Moved Right")
	if(action == ActionManager.ActionType.ACTION_DOWN_LEFT):
		move_player(Vector2i.DOWN + Vector2i.LEFT)
		consoleManager.sendMessage("Moved Down-Left")
	if(action == ActionManager.ActionType.ACTION_DOWN):
		move_player(Vector2i.DOWN)
		consoleManager.sendMessage("Moved Down")
	if(action == ActionManager.ActionType.ACTION_DOWN_RIGHT):
		move_player(Vector2i.DOWN + Vector2i.RIGHT)
		consoleManager.sendMessage("Moved Down-Right")
	if(action == ActionManager.ActionType.ACTION_WAIT):
		gameLoopManager.end_Step()

func move_player(direction : Vector2i):
	var tile = map.get_tile_content(GameGrid.world_to_unit(position) + direction)
	if(tile == 0):
		TweenAnims.playMoveTween(self,position, direction, GameGrid.pixelsToUnit, gameLoopManager.end_Step)
	else:
		gameLoopManager.end_Step()
	
	
