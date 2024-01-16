extends Node

signal new_action(action : ActionType)

enum ActionType {ACTION_UP_LEFT, ACTION_UP, ACTION_UP_RIGHT, ACTION_LEFT, ACTION_RIGHT, ACTION_DOWN_LEFT, ACTION_DOWN, ACTION_DOWN_RIGHT, ACTION_WAIT}

var isWaitingForAction : bool = true

func send_New_Action(action : ActionType):
	if(isWaitingForAction):
		new_action.emit(action)
		isWaitingForAction = false
	
