class_name DungeonGenerator

static var rng = RandomNumberGenerator.new()
	
static func generate_dungeon(gridSize : Vector2i, wallID:int, floorID:int, nbOfStep : int, seed : int) :
	#Set Seed
	rng.seed = seed
	#Create Map
	var tileGrid = Array2D.new()
	tileGrid.resize(gridSize).fill(wallID)
	var zone = Rect2i(Vector2i.ZERO, Vector2i(gridSize.x, gridSize.y))
	var zones = _divideZoneRecursive(tileGrid, floorID, zone, nbOfStep)
	print(tileGrid)
	#Populate Rooms
	var rooms = _extract_rooms_from_zone_recursive(zones)
	var playerPosition = get_random_position_in_room(get_random_room(rooms))
	#HACK Until entity instantiation is done properly
	return Map.new(tileGrid, {}, {playerPosition = playerPosition}, {}, {})
		
#Create Rooms and Corridors		
	
static func _divideZoneRecursive(gameGrid:Array2D, floorID:int, zone:Rect2i, nbOfStep : int):
	#If the zone is big enough to still being able to be divided
	if(nbOfStep > 0 && zone.size.x >= 10 && zone.size.y >= 10):
		var subZones = _cutZone(zone)
		subZones.zone1 = _divideZoneRecursive(gameGrid, floorID, subZones.zone1, nbOfStep - 1)
		subZones.zone2 = _divideZoneRecursive(gameGrid, floorID, subZones.zone2, nbOfStep - 1)
		var activeZone1 = _getActiveZone(subZones.zone1)
		var activeZone2 = _getActiveZone(subZones.zone2)
		#Find a way to simplify this block code
		if(subZones.isSeparationVertical):
			var yMin = max(activeZone1.position.y, activeZone2.position.y)
			var yMax = min(activeZone1.position.y + activeZone1.size.y - 1, activeZone2.position.y + activeZone2.size.y - 1)
			var y = rng.randi_range(yMin, yMax)
			
			var xStart : int
			var xEnd : int
			for x in range(activeZone1.position.x, activeZone1.position.x + activeZone1.size.x):
				if(gameGrid.get_value(Vector2i(x,y)) == floorID):
					xStart = x
					break
			for x in range(activeZone2.position.x, activeZone2.position.x + activeZone2.size.x):
				if(gameGrid.get_value(Vector2i(x,y)) == floorID):
					xEnd = x
					break
			for x in range(xStart, xEnd):
				gameGrid.set_value(Vector2i(x,y), floorID)
		else:
			var xMin = max(activeZone1.position.x, activeZone2.position.x)
			var xMax = min(activeZone1.position.x + activeZone1.size.x - 1, activeZone2.position.x + activeZone2.size.x - 1)
			var x = rng.randi_range(xMin, xMax)
			
			var yStart : int
			var yEnd : int
			for y in range(activeZone1.position.y, activeZone1.position.y + activeZone1.size.y):
				if(gameGrid.get_value(Vector2i(x,y)) == floorID):
					yStart = y
					break
			for y in range(activeZone2.position.y, activeZone2.position.y + activeZone2.size.y):
				if(gameGrid.get_value(Vector2i(x,y)) == floorID):
					yEnd = y
					break
			for y in range(yStart, yEnd):
				gameGrid.set_value(Vector2i(x,y), floorID)
				
		subZones.activeZone = activeZone1.merge(activeZone2)
		return subZones
	#Create a room in the current zone
	else:
		var room = _createRoom(gameGrid, floorID, zone)
		return {zone = zone, room = room}


static func _getActiveZone(zone):
	if(zone.has("room")):
		return zone.room
	else:
		return zone.activeZone
		

static func _cutZone(zone:Rect2i): 
	var zone1
	var zone2
	var isSeparationVertical = false
	if zone.size.x == zone.size.y:
		isSeparationVertical = rng.randi() % 2 == 0
	else:
		isSeparationVertical = zone.size.x > zone.size.y
	if isSeparationVertical:
		var cutPoint = rng.randi_range(5, zone.size.x - 5)
		zone1 = zone.grow_side(SIDE_RIGHT, -cutPoint)
		zone2 = zone.grow_side(SIDE_LEFT, -(zone.size.x - cutPoint))
	else:
		var cutPoint = rng.randi_range(5, zone.size.y - 5)
		zone1 = zone.grow_side(SIDE_BOTTOM, -cutPoint)
		zone2 = zone.grow_side(SIDE_TOP, -(zone.size.y - cutPoint))
	return {zone1 = zone1, zone2 = zone2, isSeparationVertical = isSeparationVertical}

static func _createRoom(gameGrid:Array2D, floorID:int, zone:Rect2i):
	var shrinkLeft = -rng.randi_range(1, min(5,zone.size.x / 2 - 1))
	var shrinkTop = -rng.randi_range(1, min(5,zone.size.y / 2 - 1))
	var shrinkRight = -rng.randi_range(1, min(5,zone.size.x / 2 - 1))
	var shrinkBottom = -rng.randi_range(1, min(5,zone.size.y / 2 - 1))
	var room = zone.grow_individual(shrinkLeft, shrinkTop, shrinkRight, shrinkBottom)
	for x in range(room.position.x, room.position.x + room.size.x):
		for y in range(room.position.y, room.position.y + room.size.y):
			gameGrid.set_value(Vector2i(x,y), floorID)
	return room
	
#Populate Rooms
	
static func _extract_rooms_from_zone_recursive(zone):
	if(zone.has("room")):
		return [zone.room]
	else:
		var rooms = []
		rooms.append_array(_extract_rooms_from_zone_recursive(zone.zone1))
		rooms.append_array(_extract_rooms_from_zone_recursive(zone.zone2))
		return rooms
		
static func get_random_room(rooms : Array):
	return rooms[rng.randi_range(0, rooms.size()-1)]
	
static func get_random_position_in_room(room : Rect2i):
	var x = rng.randi_range(room.position.x, room.position.x + room.size.x - 1)
	var y = rng.randi_range(room.position.y, room.position.y + room.size.y - 1)
	return Vector2i(x,y)
