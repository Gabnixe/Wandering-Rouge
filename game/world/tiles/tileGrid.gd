extends TileMap

var tileGrid : Array2D
	
func set_tileGrid(newTileGrid : Array2D):
	tileGrid = newTileGrid
	
	for x in tileGrid.size_x():
		for y in tileGrid.size_y():
			set_cell(0, Vector2i(x,y), tileGrid.get_value(Vector2i(x,y)), Vector2i(0,0))
	
func on_tileGrid_Update(position : Vector2i, newTile : int):
	set_cell(0, position, newTile, Vector2i(0,0))
