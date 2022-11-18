extends Node2D

signal player_died

export(PackedScene) var player_scene

var player_stats = preload("res://Player/player_stats.tres")

onready var player_spawn = $PlayerSpawn
onready var enemy_spawner = $EnemySpawner
onready var wave_manager = $WaveManager
onready var item_manager = $ItemManager
onready var arena = $Arena
onready var player = player_scene.instance()

func _ready():
	wave_manager.init(arena, enemy_spawner)
	player.connect("died", self, "_on_player_died")
	player._get_camera_limits = funcref(arena, "get_camera_limits")
	player._add_item = funcref(item_manager, "add_item")

func start_wave() -> void:
#	show()
#	add_child(player)
	player.global_position = player_spawn.global_position
	wave_manager.start()

func start_first_wave(selection: Dictionary) -> void:
	show()
	add_child(player)
	player.init(selection)
	player.global_position = player_spawn.global_position
	player_stats.reset()
	wave_manager.start()

func end_wave() -> void:
	remove_child(player)
	wave_manager.stop()
	player.global_position = player_spawn.global_position
#	hide()

func _on_player_died() -> void:
	end_wave()
	emit_signal("player_died")

func _on_selection_done(selection: Dictionary) -> void:
	start_first_wave(selection)

