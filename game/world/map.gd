extends Node2D

var tileGrid : Array2D
var effects : Dictionary
var entities : Dictionary
var items : Dictionary
var objects : Dictionary

func _ready():
	var map = DungeonGenerator.generate_dungeon(Vector2i(50,50), 1, 0, 4, randi())
	$tileGrid.set_tileGrid(map.tileGrid)
	tileGrid = map.tileGrid
	print(tileGrid)
	$player.position = map.playerPosition * 10
	
func get_tile_content(gridPosition : Vector2i):
	return tileGrid.get_value(gridPosition)
