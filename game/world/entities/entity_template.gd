extends Resource

@export var name: StringName
@export var sprite: Texture2D

func _init(p_name = "default", p_sprite = null ):
	name = p_name
	sprite = p_sprite
