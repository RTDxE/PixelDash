extends Control

var gameScene = preload("res://gamer.tscn")

func _ready() -> void:
	pass


func _on_startButton_pressed() -> void:
	get_tree().change_scene_to(gameScene)
