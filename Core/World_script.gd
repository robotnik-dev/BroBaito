extends Node2D

signal player_died
signal wave_cleared(wave_number)

export(PackedScene) var player_scene

var player_stats = preload("res://Player/player_stats.tres")
var current_wave: int = 1

onready var enemy_spawner = $EnemySpawner
onready var wave_manager = $WaveManager
onready var item_manager = $ItemManager
onready var arena = $Arena
onready var player = player_scene.instance()

func _ready():
	wave_manager.init(arena, enemy_spawner)
	wave_manager.connect("wave_cleared", self, "_on_wave_cleared")
	player.connect("died", self, "_on_player_died")
	player._get_camera_limits = funcref(arena, "get_camera_limits")

func start_wave() -> void:
#	show()
	add_child(player)
	player.global_position = arena.global_position
	wave_manager.start(current_wave)

func start_first_wave(selection: Dictionary) -> void:
	show()
	add_child(player)
	player.init(selection)
	player.global_position = arena.global_position
	player_stats.reset()
	wave_manager.start(current_wave)

func end_wave() -> void:
	remove_child(player)
	wave_manager.stop()
#	player.global_position = player_spawn.global_position
#	hide()

func get_remaining_wave_time() -> float:
	return wave_manager.wave_timer.time_left

func _on_wave_cleared(wave_number: int) -> void:
	end_wave()
	current_wave += 1
	emit_signal("wave_cleared", wave_number)

func _on_player_died() -> void:
	end_wave()
	current_wave = 1
	emit_signal("player_died")

func _on_selection_done(selection: Dictionary) -> void:
	start_first_wave(selection)

