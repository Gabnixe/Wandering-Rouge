extends Control

var consoleManager : ConsoleManager

var textBox : RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	textBox = $ColorRect/MarginContainer/RichTextLabel
	consoleManager = get_node("/root/ConsoleManager")
	consoleManager.new_message.connect(_on_new_message)


func _on_new_message(newMessage : String):
	textBox.text += newMessage + "\n"
