tool

extends Node2D

export(PackedScene) var weapon_slot_scene

export(int) var maximum_slots = 6
export(int) var weapon_slots = 0 setget set_weapon_slots
export(float) var spawn_distance = 100.0

func set_weapon_slots(value: int) -> void:
	if value > maximum_slots:
		return
	
	var children = get_children()
	if children:
		for child in children:
			remove_child(child)
	
	weapon_slots = value
	for _i in range(value):
		_add_weapon_slot(weapon_slot_scene)

func add_weapon(weapon_scene: PackedScene) -> void:
	for slot in get_children():
		var success = slot.add_weapon(weapon_scene)
		if success:
			break

func delete_all_weapons() -> void:
	for slot in get_children():
		slot.delete_weapon()

func _add_weapon_slot(_weapon_slot_scene: PackedScene) -> void:
	var degree_step = 360 / (weapon_slots)
	var slots = get_children()
	var degree = 0
	for slot in slots:
		var new_theta = deg2rad(degree)
		var new_pos: Vector2 = polar2cartesian(spawn_distance, new_theta)
		slot.position = new_pos
		degree += degree_step
	
	var weapon_slot = _weapon_slot_scene.instance()
	add_child(weapon_slot)
	weapon_slot.owner = self
	
	var theta = deg2rad(degree)
	var spawn_pos: Vector2 = polar2cartesian(spawn_distance, theta)
	weapon_slot.position = spawn_pos
