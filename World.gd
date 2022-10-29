extends Node2D


export(NodePath) var enemy_spawner_path
onready var enemy_spawner = get_node(enemy_spawner_path)

func _ready() -> void:
	randomize()


func _on_Timer_timeout() -> void:
	var rect = get_viewport_rect()
	var beginning = rect.position
	var end = rect.end
	
	var random_x = rand_range(beginning.x, end.x)
	var random_y = rand_range(beginning.y, end.y)
	var random_position = Vector2(random_x, random_y)
	enemy_spawner.spawn_enemy(random_position)
