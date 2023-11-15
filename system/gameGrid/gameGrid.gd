class_name GameGrid
extends Node

const array2D = preload("res://utils/array2D.gd")

var grid : Array
var gridSize : Vector2 = Vector2(10,10)

func _ready():
	grid = array2D.create_array2D(gridSize.x,gridSize.y, 1)
	grid[4][4] = 0
	array2D.print_array2D(grid)
	

