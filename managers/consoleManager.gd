extends Node

signal update_log(messages: Array[String])

var messages : Array[String]
var activeMessages : Array[String]

func _ready():
	activeMessages.resize(4)
	activeMessages.fill("")

func sendMessage(message: String):
	messages.append(message)
	print(messages)
	activeMessages.pop_front()
	activeMessages.append(message)
	update_log.emit(activeMessages)
