class_name GameGrid

const pixelsToUnit = 24

static func world_to_unit(worldPos : Vector2i):
	var result : Vector2i
	result = worldPos / pixelsToUnit
	return result

static func unit_to_world(unitPos : Vector2i):
	return unitPos * pixelsToUnit
