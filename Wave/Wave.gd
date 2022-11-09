extends YSort

export(NodePath) var enemy_spawner_path

var _arena: Node2D

onready var enemy_spawner = get_node(enemy_spawner_path)

func init(arena: Node2D) -> void:
	_arena = arena

func start() -> void:
	_set_difficulty()
	_start_wave_timer()
	_start_spawn_timer()

func stop() -> void:
	_reset_timer()
	_despawn_enemies()

func _despawn_enemies() -> void:
	var enemies = get_tree().get_nodes_in_group("enemy")
	for enemy in enemies:
		enemy.queue_free()
	
func _reset_timer() -> void:
	$SpawnTimer.stop()
	$WaveTimer.stop()

func _set_difficulty() -> void:
	pass

func _start_wave_timer() -> void:
	$WaveTimer.wait_time = 2
	$WaveTimer.start()

func _start_spawn_timer() -> void:
	$SpawnTimer.wait_time = 1
	$SpawnTimer.start()
	
func _spawn_enemies(number: int) -> void:
	var beginning = Vector2.ZERO
	var end = _arena.size
	for i in range(number):
		var random_x = rand_range(beginning.x, end.x)
		var random_y = rand_range(beginning.y, end.y)
		var random_position = Vector2(random_x, random_y)
		enemy_spawner.spawn_enemy(random_position)

func _on_WaveTimer_timeout() -> void:
	pass

func _on_SpawnTimer_timeout() -> void:
	_spawn_enemies(5)
