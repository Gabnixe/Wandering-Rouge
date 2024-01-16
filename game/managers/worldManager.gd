extends Node

signal gameMap_Changed( gameMap )

func _ready():
	create_new_map()

func create_new_map():
	GameMapGenerator.create_new_GameMap()
