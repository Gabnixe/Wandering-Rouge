class_name GameGrid
extends Node

const array2D = preload("res://utils/array2D.gd")

var gameGrid : Array
var gridSize : Vector2i = Vector2i(20,20)

func _ready():
	for n in 10:
		gameGrid = array2D.create_array2D(gridSize.x,gridSize.y, "■")
		var gridRectangle = Rect2i(Vector2i.ZERO, Vector2i(gridSize.x, gridSize.y))
		divideGridRecursive(gameGrid,gridRectangle)
		array2D.print_array2D(gameGrid)
		print(" ")
		print(" ")
		print(" ")
		
func divideGridRecursive(gameGrid:Array, grid:Rect2i):
	if(grid.size.x >= 10 && grid.size.y >= 10):
		var subGrids = cutGrid(grid)
		subGrids[0] = divideGridRecursive(gameGrid,subGrids[0])
		subGrids[1] = divideGridRecursive(gameGrid,subGrids[1])
		return subGrids
	else:
		createRoom(gameGrid, grid)
		return grid

func cutGrid(grid:Rect2i): 
	var grid1
	var grid2
	var gridIsWiderThanTall = false
	if grid.size.x == grid.size.y:
		gridIsWiderThanTall = randi() % 2 == 0
	else:
		gridIsWiderThanTall = grid.size.x > grid.size.y
		
	if gridIsWiderThanTall:
		var cutPoint = randi_range(5, grid.size.x - 5)
		grid1 = grid.grow_side(SIDE_LEFT, -cutPoint)
		grid2 = grid.grow_side(SIDE_RIGHT, -(grid.size.x - cutPoint))
	else:
		var cutPoint = randi_range(5, grid.size.y - 5)
		grid1 = grid.grow_side(SIDE_BOTTOM, -cutPoint)
		grid2 = grid.grow_side(SIDE_TOP, -(grid.size.y - cutPoint))
	return [grid1, grid2]

func createRoom( grid:Array, zone:Rect2i ):
	var XRoomStart = randi_range(1, zone.size.x / 2 - 1)
	var XRoomEnd = randi_range(zone.size.x / 2 + 1, zone.size.x - 2)
	var YRoomStart = randi_range(1, zone.size.y / 2 - 1)
	var YRoomEnd = randi_range(zone.size.y / 2 + 1, zone.size.y - 2)
	XRoomStart += zone.position.x
	XRoomEnd += zone.position.x
	YRoomStart += zone.position.y
	YRoomEnd += zone.position.y
	for x in range(XRoomStart,XRoomEnd + 1):
		for y in range(YRoomStart,YRoomEnd + 1):
			grid[x][y] = " "
