extends Node2D

onready var player = $player
var start_tmap = preload("res://tmaps/start.tscn")
var tmaps = [
	preload("res://tmaps/1.tscn"),
	preload("res://tmaps/2.tscn"),
	preload("res://tmaps/3.tscn"),
	preload("res://tmaps/4.tscn"),
	preload("res://tmaps/5.tscn"),
	preload("res://tmaps/6.tscn"),
	preload("res://tmaps/7.tscn"),
	preload("res://tmaps/8.tscn"),
]

func _ready() -> void:
	randomize()
	var offset = 256
	var t = start_tmap.instance()
	add_child(t)
	
	for i in 10:
		var ts = tmaps[randi()%tmaps.size()].instance()
		ts.position.x += offset
		add_child(ts)
		offset += 512

func _process(delta: float) -> void:
	$UI/Label.text = str(int(player.position.x / 16))
