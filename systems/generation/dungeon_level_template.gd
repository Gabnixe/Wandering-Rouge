extends Resource

class_name DungeonLevelTemplate

@export var gridSize : Vector2i
@export var nbOfStep : int
@export var tileset : TileSet

func _init(p_gridSize = Vector2i(0,0), p_nbOfStep = 1, p_tileset = null):
	gridSize = p_gridSize
	nbOfStep = p_nbOfStep
	tileset = p_tileset
