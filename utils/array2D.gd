#Utility functions for 2D arrays
static func create_array2D(width : int, height : int, fillObject = null):
	var array2D = []

	for x in range(width):
		var column = []
		if fillObject:
			for y in range(height):
				column.append(fillObject)
		else:
			column.resize(height)
		array2D.append(column)

	return array2D
	
static func print_array2D(array2D):
	for x in array2D.size():
		var output = ""
		for y in array2D[x].size():
			output += str(array2D[x][y])
			output += "	"
		print(output)
		print()
			


