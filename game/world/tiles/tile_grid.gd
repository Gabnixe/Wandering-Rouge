extends TileMap

var map : Map

func set_map(p_map : Map):
	map = p_map
	set_tileGrid(p_map.tileGrid)
	
func set_tileGrid(tileGrid : Array2D):	
	for x in tileGrid.size_x():
		for y in tileGrid.size_y():
			set_cell(0, Vector2i(x,y), tileGrid.get_value(Vector2i(x,y)), Vector2i(0,0))
	
func update_tileGrid(position : Vector2i, newTile : int):
	set_cell(0, position, newTile, Vector2i(0,0))
