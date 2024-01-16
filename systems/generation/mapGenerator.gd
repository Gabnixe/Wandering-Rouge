class_name GameMapGenerator

static func create_new_GameMap():
	var tileGrid = DungeonGenerator.generate_dungeon(Vector2i(50,50), 4, randi())
	
	Array2D.print_array2D(tileGrid)
	print(" ")
	print(" ")
	print(" ")
	SaveToJSON.saveToJSON("user://save_game.json", tileGrid)
	Array2D.print_array2D(SaveToJSON.readJSON("user://save_game.json"))
	
	
