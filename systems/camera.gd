extends Camera2D

func _ready():
	get_node("/root/GameLoopManager").camera = self

func move(newPosition: Vector2):
	position = newPosition
	force_update_scroll()
	
func moveCamera(newPosition: Vector2):
	var tween = self.create_tween()
	tween.tween_method(move, position, position + (newPosition * 10), 0.1)
