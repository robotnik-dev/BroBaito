extends Node2D

export(int) var maximum_slots: int = 6
export(PackedScene) var weapon_slot_scene

func _ready() -> void:
	_add_weapon_slots()

func _add_weapon_slots() -> void:
	var spawn_path = $Path2D/PathFollow2D
	for i in maximum_slots:
		spawn_path.unit_offset = randf()
		var spawn_position = spawn_path.position
		var weapon_slot = weapon_slot_scene.instance()
		weapon_slot.global_position = spawn_position
		add_child(weapon_slot)


func add_weapon(weapon_scene: PackedScene) -> void:
	for slot in get_children():
		if slot.has_method("is_free"):
			if slot.is_free():
				slot.add_weapon(weapon_scene)
				break

func fire() -> void:
	for slot in get_children():
		if slot.has_method("fire_weapon_in_slot"):
			slot.fire_weapon_in_slot() 
