extends Node

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_down"):
		var img = get_viewport().get_texture().get_data()
		img.flip_y()
		img.save_png("res://screenshots/" + str(OS.get_unix_time()) + ".png")