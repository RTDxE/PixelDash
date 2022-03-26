extends KinematicBody2D

var speed = 0
var target_rot = 0
var gravity = 0
var tm

var point_iter = 0

var vel: Vector2

onready var body_node = $body
onready var trail_node = $"../trail"

func _ready() -> void:
	for i in 24:
		trail_node.add_point(global_position + Vector2(-(24-i) * 2, 0))

func _process(delta: float) -> void:
	if is_on_floor():
		body_node.rotation_degrees = lerp(body_node.rotation_degrees, 0, delta * 20)
	else:
		body_node.rotation_degrees = lerp(body_node.rotation_degrees, (vel.y)/2, delta * 5)

func _physics_process(delta: float) -> void:
	if point_iter % 3 == 0:
		trail_node.add_point(global_position)
		
		if trail_node.points.size() > 24:
			trail_node.remove_point(0)
	else:
		trail_node.points[trail_node.points.size()-1] = global_position
	
	point_iter += 1
	
	vel = Vector2(100, gravity)
	
	move_and_slide(vel, Vector2.UP)
	
	if is_on_floor():
		if tm != null:
			var pos = tm.world_to_map(position - Vector2(0, -8) - tm.position)
			if tm.get_cellv(pos) == 1:
				die()
				return
		gravity = 10
		if Input.is_action_just_pressed("jump") or Input.is_mouse_button_pressed(BUTTON_LEFT):
			gravity = -150
	else:
		gravity += 600 * delta
	
	if is_on_wall():
		die()
		return
	elif is_on_ceiling():
		if tm != null:
			var pos = tm.world_to_map(position - Vector2(0, 8) - tm.position)
			if tm.get_cellv(pos) == 1:
				die()
				return
	
	if position.y > 512:
		die(true)
		return

func die(fall: bool = false) -> void:
	set_process(false)
	set_physics_process(false)
	get_parent().end_game(fall)

func _on_detector_body_entered(body: Node) -> void:
	if body is TileMap:
		tm = body


func _on_detector_body_exited(body: Node) -> void:
	if body is TileMap and body == tm:
		tm = null
