class_name GameGrid
extends Node

const array2D = preload("res://utils/array2D.gd")

var gameGrid : Array
var gridSize : Vector2i = Vector2i(50,50)

func _ready():
	for n in 1:
		gameGrid = array2D.create_array2D(gridSize.x,gridSize.y, "██")
		var zoneRectangle = Rect2i(Vector2i.ZERO, Vector2i(gridSize.x, gridSize.y))
		divideZoneRecursive(gameGrid,zoneRectangle, 4)
		array2D.print_array2D(gameGrid)
		print(" ")
		print(" ")
		print(" ")
		
func divideZoneRecursive(gameGrid:Array, zone:Rect2i, nbOfStep : int):
	#If the zone is big enough to still being able to be divided
	if(nbOfStep > 0 && zone.size.x >= 10 && zone.size.y >= 10):
		var subZones = cutZone(zone)
		subZones[0] = divideZoneRecursive(gameGrid,subZones[0], nbOfStep - 1)
		subZones[1] = divideZoneRecursive(gameGrid,subZones[1], nbOfStep - 1)
		var activeZone1 = getActiveZone(subZones[0])
		var activeZone2 = getActiveZone(subZones[1])
		if(subZones[2]):
			var min = max(activeZone1.position.y, activeZone2.position.y)
			var max = min(activeZone1.position.y + activeZone1.size.y - 1, activeZone2.position.y + activeZone2.size.y - 1)
			var y = randi_range(min, max)
			
			var xStart : int
			var xEnd : int
			for x in range(activeZone1.position.x, activeZone1.position.x + activeZone1.size.x - 1):
				if(gameGrid[x][y] == "  " || gameGrid[x][y] == "()"):
					xStart = x
					break
			for x in range(activeZone2.position.x, activeZone2.position.x + activeZone2.size.x - 1):
				if(gameGrid[x][y] == "  " || gameGrid[x][y] == "()"):
					xEnd = x
					break
			for x in range(xStart, xEnd):
				gameGrid[x][y] = "()"
		else:
			var min = max(activeZone1.position.x, activeZone2.position.x)
			var max = min(activeZone1.position.x + activeZone1.size.x - 1, activeZone2.position.x + activeZone2.size.x - 1)
			var x = randi_range(min, max)
			
			var yStart : int
			var yEnd : int
			for y in range(activeZone1.position.y, activeZone1.position.y + activeZone1.size.y - 1):
				if(gameGrid[x][y] == "  " || gameGrid[x][y] == "()"):
					yStart = y
					break
			for y in range(activeZone2.position.y, activeZone2.position.y + activeZone2.size.y - 1):
				if(gameGrid[x][y] == "  " || gameGrid[x][y] == "()" ):
					yEnd = y
					break
			for y in range(yStart, yEnd):
				gameGrid[x][y] = "()"
				
		subZones.append(activeZone1.merge(activeZone2))
		return subZones
	#Create a room in the current zone
	else:
		var room = createRoom(gameGrid, zone)
		return {zone = zone, room = room}


func getActiveZone(zone):
	if(zone.has("room")):
		return zone.room
	else:
		return zone[3]
		

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
	var shrinkLeft = -randi_range(1, min(5,zone.size.x / 2 - 1))
	var shrinkTop = -randi_range(1, min(5,zone.size.y / 2 - 1))
	var shrinkRight = -randi_range(1, min(5,zone.size.x / 2 - 1))
	var shrinkBottom = -randi_range(1, min(5,zone.size.y / 2 - 1))
	var room = zone.grow_individual(shrinkLeft, shrinkTop, shrinkRight, shrinkBottom)
	for x in range(room.position.x, room.position.x + room.size.x):
		for y in range(room.position.y, room.position.y + room.size.y):
			gameGrid[x][y] = "  "
	return room
