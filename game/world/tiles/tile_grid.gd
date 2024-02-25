extends TileMap

var map : Map

func set_map(p_map : Map):
	map = p_map
	set_tileGrid(p_map.tileGrid)
	
func set_tileGrid(tileGrid : Array2D):	
	for x in tileGrid.size_x():
		for y in tileGrid.size_y():
			BetterTerrain.set_cell(self, 0, Vector2i(x,y), tileGrid.get_value(Vector2i(x,y)))	
	BetterTerrain.update_terrain_area(self, 0, Rect2i(Vector2i.ZERO, Vector2i(tileGrid.size_x(), tileGrid.size_y())))
	
func update_tileGrid(position : Vector2i, newTile : int):
	set_cell(0, position, newTile, Vector2i(0,0))
