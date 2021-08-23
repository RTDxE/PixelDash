extends Sprite

var speed = 0
var target_rot = 0

func _process(delta: float) -> void:
	if Input.is_action_pressed("move_up"):
		speed += 50 * delta
	elif Input.is_action_pressed("move_down"):
		speed -= 50 * delta
	else:
		speed *= 0.98
		target_rot *= 0.95
	speed = clamp(speed, -100, 100)
	if abs(speed) > 10:
		if Input.is_action_pressed("move_left"):
			target_rot -= 1 * sign(speed)
		elif Input.is_action_pressed("move_right"):
			target_rot += 1 * sign(speed)
		else:
			target_rot *= 0.95
	else:
			target_rot *= 0.95
	var s = 15 - abs(speed / 100.0) * 15
	target_rot = clamp(target_rot, -30 - s, 30 + s)
	
	rotation_degrees = lerp(rotation_degrees, rotation_degrees + target_rot, delta * 5)
	$body.rotation_degrees = lerp($body.rotation_degrees, target_rot * 1.1, delta * 15)
	position += Vector2(-speed, 0).rotated(rotation) * delta
