extends Node

export(PackedScene) var enemy_scene

func spawn_enemy(spawn_location: Vector2) -> void:
	var enemy = enemy_scene.instance()
	enemy.init(spawn_location)
	add_child(enemy)
