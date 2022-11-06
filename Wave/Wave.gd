extends Node2D

export(NodePath) var enemy_spawner_path
onready var enemy_spawner = get_node(enemy_spawner_path)

export(PackedScene) var player_scene
onready var player = player_scene.instance()

export(PackedScene) var arena_scene
onready var arena = arena_scene.instance()

var wave : int setget set_wave, get_wave
var character : Resource setget set_character, get_character

var wave_cleared: bool = false

func set_wave(value: int) -> void:
	wave = value

func get_wave() -> int:
	return wave

func set_character(value: Resource) -> void:
	character = value

func get_character() -> Resource:
	return character

func start() -> void:
	_spawn_player()
	_spawn_arena()
	_set_difficulty()
	_start_wave_timer()
	_start_spawn_timer()

func stop() -> void:
	#TODO:
	_despawn_enemies()
	_despawn_player()
	_despawn_arena()
	_reset_timer()

func _despawn_enemies() -> void:
	pass

func _despawn_player() -> void:
	pass

func _despawn_arena() -> void:
	pass
 
func _reset_timer() -> void:
	pass

func _spawn_player() -> void:
	add_child(player)

func _spawn_arena() -> void:
	add_child(arena)

func _set_difficulty() -> void:
	pass

func _start_wave_timer() -> void:
	$WaveTimer.wait_time = 2
	$WaveTimer.start()

func _start_spawn_timer() -> void:
	$SpawnTimer.wait_time = 1
	$SpawnTimer.start()
	
func _spawn_enemies() -> void:
	var beginning = Vector2.ZERO
	var end = arena.size
	var random_x = rand_range(beginning.x, end.x)
	var random_y = rand_range(beginning.y, end.y)
	var random_position = Vector2(random_x, random_y)
	enemy_spawner.spawn_enemy(random_position)

func _on_WaveTimer_timeout() -> void:
	SignalHandler.emit_signal("wave_cleared")

func _on_SpawnTimer_timeout() -> void:
	_spawn_enemies()
