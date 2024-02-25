extends Resource

class_name DungeonTemplate

@export var levels : Array[DungeonLevelTemplate] = []

func _init(p_levels : Array[DungeonLevelTemplate] = []):
	levels = p_levels
