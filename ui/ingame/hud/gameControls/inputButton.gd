extends Button

@export var buttonInput : InputManager.InputType

var inputManager : InputManager

func _ready():
	inputManager = get_node("/root/InputManager")
	self.pressed.connect(_on_pressed)

func _on_pressed():
	inputManager.sendInput(buttonInput)
