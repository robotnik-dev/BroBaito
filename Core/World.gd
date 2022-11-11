extends Node2D

signal player_died

export(NodePath) var wave_path
export(NodePath) var arena_path
export(NodePath) var player_path

onready var wave = get_node(wave_path)
onready var arena = get_node(arena_path)
onready var player = get_node(player_path)
onready var player_spawn = $PlayerSpawn

func _ready():
	wave.init(arena)
	player.connect("died", self, "_on_player_died")

func start_wave() -> void:
	show()
	player.global_position = player_spawn.global_position
	wave.start()

func start_first_wave() -> void:
	show()
	player.reset_stats()
	player.global_position = player_spawn.global_position
	wave.start()

func end_wave() -> void:
	wave.stop()
	player.global_position = player_spawn.global_position
	hide()

func _on_player_died() -> void:
	end_wave()
	emit_signal("player_died")

func _on_selection_done() -> void:
	start_first_wave()
