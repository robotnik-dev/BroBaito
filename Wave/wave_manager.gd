extends Node

signal wave_cleared(wave_number)

# [wave_one.tres, ... , wave_twenty.tres]
export(Array) var waves

var current_wave: Resource

var _arena: Node2D
var _enemy_spawner: Node

onready var spawn_timer = $SpawnTimer
onready var wave_timer = $WaveTimer

func init(arena: Node2D, enemy_spawner: Node) -> void:
	_arena = arena
	_enemy_spawner = enemy_spawner

func start(wave_number: int) -> void:
	for wave in waves:
		if wave.wave_number == wave_number:
			current_wave = wave
			break
	
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
		enemy.despawn()
	
func _reset_timer() -> void:
	spawn_timer.stop()
	wave_timer.stop()

func _set_difficulty() -> void:
	pass

func _start_wave_timer() -> void:
	wave_timer.wait_time = current_wave.wave_time
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
		_enemy_spawner.spawn_enemy(random_position, current_wave.enemies[0])

func _on_WaveTimer_timeout() -> void:
	emit_signal("wave_cleared", current_wave.wave_number)

func _on_SpawnTimer_timeout() -> void:
	_spawn_enemies(5)
