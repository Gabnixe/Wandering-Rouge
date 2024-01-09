class_name SaveToJSON

static func saveToJSON(fileName : String, objectToSave):
	var file = FileAccess.open(fileName, FileAccess.WRITE)
	file.store_string(JSON.stringify(objectToSave))
	file.close()
