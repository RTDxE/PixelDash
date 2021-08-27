extends Node

var _gs

signal initialized

var ads: GameScoreAds = GameScoreAds.new()
var app: GameScoreApp = GameScoreApp.new()

var is_initalized setget , get_is_initalized
func get_is_initalized() -> bool: return _gs != null

func _ready() -> void:
	if OS.has_feature("JavaScript"):
		_gs = JavaScript.get_interface("_gameScore")
		while _gs == null:
			yield(get_tree().create_timer(1), "timeout")
			_gs = JavaScript.get_interface("_gameScore")
		
		ads.init(_gs)
		app.init(_gs)

		yield(get_tree(), "idle_frame")
		emit_signal("initialized")


func add_field(key: String, value) -> void:
	if _gs == null: return
	_gs.player.add(key, value)
	_gs.player.sync()

func get_field(key: String):
	if _gs == null: return
	return _gs.player.get(key)

func set_field(key: String, value) -> void:
	if _gs == null: return
	_gs.player.set(key, value)
	_gs.player.sync()

func get_lang() -> String:
	if _gs == null: return "en"
	return _gs.language

