#Collection of Tweens used to animate entities

#TODO Change magic values for grid size

class_name TweenAnims

static func playMoveTween(entity:Node2D, currentPosition:Vector2, direction:Vector2, distance:int, callback):
	var tween = entity.create_tween()
	tween.tween_property(entity, "position", currentPosition + (direction * distance), 0.1)
	tween.finished.connect(callback)

static func playPunchTween(entity:Node2D, currentPosition:Vector2, direction:Vector2, distance:int, callback):
	var tween = entity.create_tween()
	tween.tween_property(entity, "position", currentPosition + (direction * (distance / 4)), 0.05)
	tween.tween_property(entity, "position", currentPosition + (direction * -(distance / 10)), 0.1)
	tween.tween_property(entity, "position", currentPosition, 0.05)
	tween.finished.connect(callback)
