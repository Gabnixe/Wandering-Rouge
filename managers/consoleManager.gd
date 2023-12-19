extends Node

signal new_message(message: String)

var messages : Array[String]

func sendMessage(message: String):
	messages.append(message)
	new_message.emit(message)
