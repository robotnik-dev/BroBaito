extends Node2D

export(Resource) var weapon_data
export(PackedScene) var bullet_scene
export(float) var bullet_speed = 1000.0

var enemies_in_range: Array

onready var player_stats = preload("res://Player/player_stats.tres")
onready var nozzle = $Nozzle
onready var attack_radius = $AttackRadius/CollisionShape2D
onready var cooldown = $Cooldown

func init() -> void:
	pass

func _ready() -> void:
	attack_radius.shape.radius = player_stats.attack_range
	cooldown.wait_time = 1 / (weapon_data.base_attacks_per_second + player_stats.attack_speed)

func fire() -> void:
	if not enemies_in_range:
		return
	var bullet = bullet_scene.instance()
	var spawn_location = nozzle.global_position
	var spawn_rotation = transform.get_rotation()
	var direction = (spawn_location - global_position).normalized()
	
	bullet.init(
		spawn_location,
		spawn_rotation,
		bullet_speed,
		direction,
		weapon_data.base_damage
	)
	var world = get_tree().get_nodes_in_group("world")
	world[0].add_child(bullet)
	bullet.owning_weapon = self

func _physics_process(delta: float) -> void:
	var nearest_enemy = _get_position_of_nearest_enemy()
	look_at(nearest_enemy)

func _get_position_of_nearest_enemy() -> Vector2:
	var enemies = get_tree().get_nodes_in_group("enemy")
	if not enemies:
		return global_position + Vector2.RIGHT
	
	var nearest_enemy = enemies[0]
	
	for enemy in enemies:
		if not enemy.spawned:
			continue
		var distance_to_nearest_enemy = global_position.distance_squared_to(nearest_enemy.global_position)
		var distance: float = global_position.distance_squared_to(enemy.global_position)
		var nearest: float = min(distance_to_nearest_enemy, distance)
		if nearest == distance:
			nearest_enemy = enemy
	
	return nearest_enemy.global_position

func _on_AttackRadius_area_entered(area: Area2D) -> void:
	if area.owner is Enemy:
		area.owner.in_range()
		enemies_in_range.append(area.owner)

func _on_AttackRadius_area_exited(area: Area2D) -> void:
	if area.owner is Enemy:
		area.owner.out_of_range()
		var idx = enemies_in_range.find(area.owner)
		if idx != -1:
			enemies_in_range.remove(idx)
	elif area.owner.owning_weapon == self:
		area.owner.call_deferred("queue_free")

func _on_Cooldown_timeout() -> void:
	fire()
