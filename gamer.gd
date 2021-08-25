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
var score: int

const TMAP_SIZE = 512
const START_SIZE = 256
var offset = START_SIZE
var prev_tmap
var current_tmap
var next_tmap


func _ready() -> void:
	randomize()
	next_tmap = start_tmap.instance()
	add_child(next_tmap)
	
	spawn_next_tmap()

func spawn_next_tmap() -> void:
	if prev_tmap != null:
		prev_tmap.queue_free()
	if current_tmap != null:
		prev_tmap = current_tmap
	if next_tmap != null:
		current_tmap = next_tmap
	next_tmap = tmaps[randi()%tmaps.size()].instance()
	next_tmap.position.x += offset
	add_child(next_tmap)
	offset += TMAP_SIZE

func _process(delta: float) -> void:
	score = int(player.position.x / 16)
	$UI/Label.text = str(int(player.position.x / 16))
	
	if player.position > next_tmap.position:
		spawn_next_tmap()

func end_game(fall: bool = false) -> void:
	set_process(false)
	if fall:
		$anim.play("die_fall")
	else:
		$anim.play("die")
	$UI/dieScore.text = tr("DISTANCE") + ": " + str(score) + "m"
	GameScore.add_field("score", score)
	var record = GameScore.get_field("record")
	if record != null:
		record = int(record)
		if record < score:
			GameScore.set_field("record", score)
			record = score
		$UI/record.text = tr("RECORD") + ": " + str(record) + "m"
	else:
		$UI/record.text = tr("RECORD") + ": <???>"
