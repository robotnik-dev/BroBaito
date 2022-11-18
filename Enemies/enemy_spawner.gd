extends Node

func spawn_enemy(spawn_location: Vector2, enemy_scene: PackedScene) -> void:
#	return
	var enemy = enemy_scene.instance()
	enemy.init(spawn_location)
	add_child(enemy)
