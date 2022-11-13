extends Node

export(PackedScene) var enemy_scene

var _arena: Node2D
var _enemy_spawner: Node

onready var spawn_timer = $SpawnTimer
onready var wave_timer = $WaveTimer

func init(arena: Node2D, enemy_spawner: Node) -> void:
	_arena = arena
	_enemy_spawner = enemy_spawner

func start() -> void:
	_set_difficulty()
	_start_wave_timer()
	_start_spawn_timer()

func stop() -> void:
	_reset_timer()
	_despawn_enemies()
	# TODO: collect loot

func _despawn_enemies() -> void:
	var enemies = get_tree().get_nodes_in_group("enemy")
	for enemy in enemies:
		enemy.queue_free()
	
func _reset_timer() -> void:
	spawn_timer.stop()
	wave_timer.stop()

func _set_difficulty() -> void:
	pass

func _start_wave_timer() -> void:
	wave_timer.wait_time = 2
	wave_timer.start()

func _start_spawn_timer() -> void:
	spawn_timer.wait_time = 1
	spawn_timer.start()
	
func _spawn_enemies(number: int) -> void:
	var beginning = Vector2.ZERO
	var end = _arena.size
	for i in range(number):
		var random_x = rand_range(beginning.x, end.x)
		var random_y = rand_range(beginning.y, end.y)
		var random_position = Vector2(random_x, random_y)
		_enemy_spawner.spawn_enemy(random_position, enemy_scene)

func _on_WaveTimer_timeout() -> void:
	pass

func _on_SpawnTimer_timeout() -> void:
	_spawn_enemies(5)
