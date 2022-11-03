extends Node2D

export(NodePath) var enemy_spawner_path
onready var enemy_spawner = get_node(enemy_spawner_path)
export(NodePath) var spawn_timer_path
onready var spawn_timer = get_node(spawn_timer_path)

var wave_number: int

func init(_wave_number: int) -> void:
	wave_number = _wave_number

func _ready() -> void:
	set_difficulty()
	randomize()

func set_difficulty() -> void:
	spawn_timer.wait_time = 1 / wave_number
	print(wave_number)
	spawn_timer.start()

func _on_Timer_timeout() -> void:
	var beginning = Vector2.ZERO
	var end = $Arena.size
	var random_x = rand_range(beginning.x, end.x)
	var random_y = rand_range(beginning.y, end.y)
	var random_position = Vector2(random_x, random_y)
	enemy_spawner.spawn_enemy(random_position)
