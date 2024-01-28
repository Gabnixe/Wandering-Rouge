extends Node2D

var tileGrid : Array
var effects : Dictionary
var entities : Dictionary
var items : Dictionary
var objects : Dictionary

func _ready():
	var map = GameMapGenerator.create_new_GameMap()
	$tileGrid.set_tileGrid(map.tileGrid)
	tileGrid = map.tileGrid
	$player.position = map.playerPosition * 10
