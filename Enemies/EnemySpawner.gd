extends Node2D

export(PackedScene) var enemy_scene

func spawn_enemy(spawn_location: Vector2) -> void:
	var enemy = enemy_scene.instance()
	enemy.init(spawn_location)
	var world = get_tree().get_nodes_in_group("world")
	world[0].add_child(enemy)
