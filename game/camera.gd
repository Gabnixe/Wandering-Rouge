extends Camera2D

func _ready():
	get_node("/root/GameLoopManager").camera = self
	
func _process(_delta):
	#This looks laggy, but a fix should be added to Godot 4.3 (https://github.com/godotengine/godot/pull/84465)
	position = get_node("/root/root/game/world/map/player").position
	force_update_scroll()

