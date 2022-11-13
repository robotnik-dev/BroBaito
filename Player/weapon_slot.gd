extends Node2D

var weapon

func add_weapon(weapon_scene: PackedScene) -> bool:
	if is_instance_valid(weapon):
		return false
	
	weapon = weapon_scene.instance()
	add_child(weapon)
	return true

func delete_weapon() -> void:
	if not is_instance_valid(weapon):
		return
	weapon.queue_free()
