extends Node2D

var map : Map

func _ready():
	var map = DungeonGenerator.generate_dungeon(Vector2i(50,50), 1, 0, 4, randi())
	$tileGrid.set_map(map)
	$player.map = map
	$player.position = map.entities.playerPosition * 10
	
