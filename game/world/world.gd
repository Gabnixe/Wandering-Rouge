extends Node2D

var map : Map

func _ready():
	var dungeon = preload("res://content/dungeons/dungeon0.tres")
	var map = DungeonGenerator.generate_dungeon(dungeon.levels[0], randi())
	$tileGrid.tile_set = (dungeon.levels[0].tileset)
	$tileGrid.set_map(map)
	$player.map = map
	$player.position = map.entities.playerPosition * 10
