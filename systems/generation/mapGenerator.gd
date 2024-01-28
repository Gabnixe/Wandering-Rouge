class_name GameMapGenerator

static var rng = RandomNumberGenerator.new()

#Do I need to separate map generator from dungeon generator?
static func create_new_GameMap():
	var map = {}
	var generatedGrid = DungeonGenerator.generate_dungeon(Vector2i(50,50), 1, 0, 4, randi())
	map.tileGrid = generatedGrid.grid
	var playerPosition = get_random_position_in_room(get_random_room(generatedGrid.rooms))
	print(generatedGrid.rooms)
	map.tileGrid[playerPosition.x][playerPosition.y] = 3;
	map.playerPosition = playerPosition
	Array2D.print_array2D(map.tileGrid)
	return map
	
static func get_random_room(rooms):
	return rooms[rng.randi_range(0, rooms.size()-1)]
	
static func get_random_position_in_room(room : Rect2i):
	var x = rng.randi_range(room.position.x, room.position.x + room.size.x - 1)
	var y = rng.randi_range(room.position.y, room.position.y + room.size.y - 1)
	return Vector2i(x,y)
