extends Node2D

var free: bool = true
var weapon

func is_free() -> bool:
	if weapon:
		return false
	else:
		return true

func fire_weapon_in_slot() -> void:
	if not free:
		if weapon:
			weapon.fire()

func add_weapon(weapon_scene: PackedScene) -> void:
	if weapon:
		return
	free = false
	
	weapon = weapon_scene.instance()
	add_child(weapon)
