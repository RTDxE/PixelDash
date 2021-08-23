extends KinematicBody2D

var speed = 0
var target_rot = 0
var gravity = 0
var tm

func _physics_process(delta: float) -> void:
	var vel = Vector2(100, gravity)
	
	move_and_slide(vel, Vector2.UP)
	
	if is_on_floor():
		if tm != null:
			var pos = (tm as TileMap).world_to_map(position - Vector2(0, -8) - tm.position)
			if (tm as TileMap).get_cellv(pos) == 1:
				get_tree().reload_current_scene()
		gravity = 10
		if Input.is_action_just_pressed("jump") or Input.is_mouse_button_pressed(BUTTON_LEFT):
			gravity = -150
	else:
		gravity += 600 * delta
	
	if is_on_wall():
		get_tree().reload_current_scene()
	elif is_on_ceiling():
		if tm != null:
			var pos = (tm as TileMap).world_to_map(position - Vector2(0, 8) - tm.position)
			if (tm as TileMap).get_cellv(pos) == 1:
				get_tree().reload_current_scene()


func _on_detector_body_entered(body: Node) -> void:
	if body is TileMap:
		tm = body


func _on_detector_body_exited(body: Node) -> void:
	if body is TileMap and body == tm:
		tm = null
