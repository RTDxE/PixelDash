extends Control

var gameScene = preload("res://gamer.tscn")

func _ready() -> void:
	GameScore.connect("initialized", self, "_gs_init")

func _gs_init() -> void:
	TranslationServer.set_locale(GameScore.get_lang())

func _on_startButton_pressed() -> void:
	$music.stop()
	get_tree().change_scene_to(gameScene)
