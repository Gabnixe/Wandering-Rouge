extends RefCounted

class_name Map

var tileGrid : Array2D
var effects : Dictionary
var entities : Dictionary
var items : Dictionary
var objects : Dictionary

func _init(p_tileGrid = Array2D.new(), p_effects = {}, p_entities = {}, p_items = {}, p_objects = {}  ):
	tileGrid = p_tileGrid
	effects = p_effects
	entities = p_entities
	items = p_items
	objects = p_objects
	
func get_tile_content(gridPosition : Vector2i):
	return tileGrid.get_value(gridPosition)
