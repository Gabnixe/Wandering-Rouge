class_name GameGrid
extends Node

const array2D = preload("res://utils/array2D.gd")

var gameGrid : Array
var gridSize : Vector2i = Vector2i(50,50)

func _ready():
	for n in 1:
		gameGrid = array2D.create_array2D(gridSize.x,gridSize.y, "■")
		var zoneRectangle = Rect2i(Vector2i.ZERO, Vector2i(gridSize.x, gridSize.y))
		divideZoneRecursive(gameGrid,zoneRectangle)
		array2D.print_array2D(gameGrid)
		print(" ")
		print(" ")
		print(" ")
		
func divideZoneRecursive(gameGrid:Array, zone:Rect2i):
	#If the zone is big enough to still being able to be divided
	if(zone.size.x >= 10 && zone.size.y >= 10):
		var subZones = cutZone(zone)
		subZones[0] = divideZoneRecursive(gameGrid,subZones[0])
		subZones[1] = divideZoneRecursive(gameGrid,subZones[1])
		var room0 : Rect2i = findNearestRoomRecursive(subZones[0], 0)[0]
		var room1 : Rect2i = findNearestRoomRecursive(subZones[1], 0)[0]
		if(subZones[2]):
			var min = max(room0.position.y, room1.position.y)
			var max = min(room0.position.y + room0.size.y - 1, room1.position.y + room1.size.y - 1)
			var y = randi_range(min, max)
			for x in range(room0.position.x + room0.size.x, room1.position.x):
				gameGrid[x][y] = " "
		else:
			var min = max(room0.position.x, room1.position.x)
			var max = min(room0.position.x + room0.size.x - 1, room1.position.x + room1.size.x - 1)
			var x = randi_range(min, max)
			for y in range(room0.position.y + room0.size.y, room1.position.y):
				gameGrid[x][y] = " "
		return subZones
	#Create a room in the current zone
	else:
		var room = createRoom(gameGrid, zone)
		return {zone = zone, room = room}

func findNearestRoomRecursive(zones, distance):
	if(zones.has("room")):
		return [zones.room, distance + 1]
	else:
		var subZone0 = findNearestRoomRecursive(zones[0], distance + 1)
		var subZone1 = findNearestRoomRecursive(zones[1], distance + 1)
		if(subZone0[1] <= subZone1[1]):
			return subZone0
		else:
			return subZone1

func cutZone(zone:Rect2i): 
	var zone1
	var zone2
	var zoneIsWiderThanTall = false
	if zone.size.x == zone.size.y:
		zoneIsWiderThanTall = randi() % 2 == 0
	else:
		zoneIsWiderThanTall = zone.size.x > zone.size.y
		
	if zoneIsWiderThanTall:
		var cutPoint = randi_range(5, zone.size.x - 5)
		zone1 = zone.grow_side(SIDE_RIGHT, -cutPoint)
		zone2 = zone.grow_side(SIDE_LEFT, -(zone.size.x - cutPoint))
	else:
		var cutPoint = randi_range(5, zone.size.y - 5)
		zone1 = zone.grow_side(SIDE_BOTTOM, -cutPoint)
		zone2 = zone.grow_side(SIDE_TOP, -(zone.size.y - cutPoint))
	return [zone1, zone2, zoneIsWiderThanTall]

func createRoom( gameGrid:Array, zone:Rect2i ):
	var shrinkLeft = -randi_range(1, zone.size.x / 2 - 1)
	var shrinkTop = -randi_range(1, zone.size.y / 2 - 1)
	var shrinkRight = -randi_range(1, zone.size.x / 2 - 1)
	var shrinkBottom = -randi_range(1, zone.size.y / 2 - 1)
	var room = zone.grow_individual(shrinkLeft, shrinkTop, shrinkRight, shrinkBottom)
	for x in range(room.position.x, room.position.x + room.size.x):
		for y in range(room.position.y, room.position.y + room.size.y):
			gameGrid[x][y] = " "
	return room
