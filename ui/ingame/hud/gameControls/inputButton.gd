extends Button

@export var buttonInput : ActionManager.ActionType

var actionManager : ActionManager

func _ready():
	actionManager = get_node("/root/ActionManager")
	self.pressed.connect(_on_pressed)

func _on_pressed():
	actionManager.send_New_Action(buttonInput)
