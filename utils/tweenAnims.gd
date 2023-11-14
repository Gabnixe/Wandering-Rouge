extends Node

#Collection of Tweens used to animate entities

#TODO Change magic values for grid size

static func playMoveTween(entity:Node2D, currentPosition:Vector2, direction:Vector2, callback):
	var tween = entity.create_tween()
	tween.tween_property(entity, "position", currentPosition + (direction * 10), 0.1)
	tween.finished.connect(callback)

static func playPunchTween(entity:Node2D, currentPosition:Vector2, direction:Vector2, callback):
	var tween = entity.create_tween()
	tween.tween_property(entity, "position", currentPosition + (direction * 2.5), 0.05)
	tween.tween_property(entity, "position", currentPosition + (direction * -1), 0.1)
	tween.tween_property(entity, "position", currentPosition, 0.05)
	tween.finished.connect(callback)
