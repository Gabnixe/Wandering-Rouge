extends RichTextLabel

var consoleManager : ConsoleManager

var activeMessages : Array[String]

func _ready():
	consoleManager = get_node("/root/ConsoleManager")
	consoleManager.new_message.connect(_on_new_message)
	
	activeMessages.resize(3)
	activeMessages.fill("")

func _on_new_message(newMessage : String):
	activeMessages.pop_front()
	activeMessages.append(newMessage)
	text = ""
	for message in activeMessages:
		text += message + "\n"
