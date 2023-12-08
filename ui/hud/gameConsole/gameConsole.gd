extends RichTextLabel

var consoleManager : ConsoleManager

func _ready():
	consoleManager = get_node("/root/ConsoleManager")
	consoleManager.update_log.connect(_on_update_log)

func _on_update_log(messages : Array[String]):
	text = ""
	for message in messages:
		text += message + "\n"
