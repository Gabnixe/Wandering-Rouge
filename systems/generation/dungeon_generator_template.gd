extends Resource

class_name DungeonGeneratorTemplate

var gridSize : Vector2i
var nbOfStep : int
var seed : int
var wallID : int 
var floorID : int

func _init(p_gridSize : Vector2i, p_nbOfStep : int, p_seed : int, p_wallID : int, p_floorID):
	gridSize = p_gridSize
	nbOfStep = p_nbOfStep
	seed = p_seed
	wallID = p_wallID
	floorID = p_floorID
