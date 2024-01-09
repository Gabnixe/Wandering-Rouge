class_name GameGrid
extends Node

const Array2D = preload("res://utils/array2D.gd")
const DungeonGenerator = preload("res://backend/systems/generation/dungeonGenerator.gd")
const SaveToJSON = preload("res://utils/saveToJSON.gd")

var gameGrid : Array
var gridSize : Vector2i = Vector2i(50,50)
var rng : RandomNumberGenerator = RandomNumberGenerator.new()

func _ready():
	
	for i in 2:
		var grid = DungeonGenerator.generate_dungeon(Vector2i(50,50), 4, randi())
		Array2D.print_array2D(grid)
		print(" ")
		print(" ")
		print(" ")
		SaveToJSON.saveToJSON("user://save_game.json", grid)
