class_name SaveToJSON

static func saveToJSON(fileName : String, objectToSave):
	var file = FileAccess.open(fileName, FileAccess.WRITE)
	file.store_string(JSON.stringify(objectToSave))
	file.close()

static func readJSON(fileName : String):
	var file = FileAccess.open(fileName, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	file.close()
	return data
