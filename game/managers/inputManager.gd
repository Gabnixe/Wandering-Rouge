extends Node

var actionManager : ActionManager

func _ready():
	actionManager = get_node("/root/ActionManager")

func _process(_delta):
	if Input.is_action_pressed("PlayerLeft"):
		actionManager.send_New_Action(ActionManager.ActionType.ACTION_LEFT)
	elif Input.is_action_pressed("PlayerRight"):
		actionManager.send_New_Action(ActionManager.ActionType.ACTION_RIGHT)
	elif Input.is_action_pressed("PlayerUp"):
		actionManager.send_New_Action(ActionManager.ActionType.ACTION_UP)
	elif Input.is_action_pressed("PlayerDown"):
		actionManager.send_New_Action(ActionManager.ActionType.ACTION_DOWN)
