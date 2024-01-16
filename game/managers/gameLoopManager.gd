extends Node

var actionManager : ActionManager

var player
var camera: Camera2D

func _ready():
	actionManager = get_node("/root/ActionManager")
	
func end_Step():
	actionManager.isWaitingForAction = true;
