extends Node

var consoleMenu : Control

func _ready():
	consoleMenu = $gameScreen/consoleMenu


func _on_chat_button_pressed():
	consoleMenu.visible = !consoleMenu.visible
