extends TileMap

var tileGrid : Array

#func _process(_delta):
#	for x in tileGrid.size():
#		for y in tileGrid[x].size():
#			if(tileGrid[x][y] == "██"):
#				set_cell(0, Vector2i(x,y), 1, Vector2i(0,0))
#			else:
#				set_cell(0, Vector2i(x,y), 0, Vector2i(0,0))
	

func set_tileGrid(newTileGrid : Array):
	tileGrid = newTileGrid
	
	for x in tileGrid.size():
		for y in tileGrid.size():
			set_cell(0, Vector2i(x,y), tileGrid[x][y], Vector2i(0,0))
	
func on_tileGrid_Update(position : Vector2i, newTile : int):
	set_cell(0, position, newTile, Vector2i(0,0))
