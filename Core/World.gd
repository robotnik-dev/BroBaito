extends Node2D

signal player_died

export(NodePath) var wave_path
export(NodePath) var arena_path
export(PackedScene) var player_scene

onready var wave = get_node(wave_path)
onready var arena = get_node(arena_path)
onready var player = player_scene.instance()
onready var player_spawn = $PlayerSpawn

func _ready():
	wave.init(arena)
	player.connect("died", self, "_on_player_died")

func start_wave() -> void:
	show()
	add_child(player)
	player.global_position = player_spawn.global_position
	wave.start()

func start_first_wave() -> void:
	show()
	add_child(player)
	player.reset_stats()
	player.global_position = player_spawn.global_position
	wave.start()

func end_wave() -> void:
	wave.stop()
	remove_child(player)
	hide()

func _on_player_died() -> void:
	end_wave()
	emit_signal("player_died")

func _on_selection_done(character, start_weapon, difficulty) -> void:
	start_wave()
