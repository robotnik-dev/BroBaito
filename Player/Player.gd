class_name Player

extends KinematicBody2D

export(PackedScene) var weapon_scene
export(NodePath) var attack_timer_path
export(NodePath) var weapon_manager_path
export(NodePath) var items_path

var max_hp = 10.0 setget set_max_hp, get_max_hp
var hp_regen = 0.0 setget set_hp_regen, get_hp_regen
var lifesteal = 0.0 setget set_lifesteal, get_lifesteal
var damage = 0.0 setget set_damage, get_damage
var meele_damage = 0.0 setget set_meele_damage, get_meele_damage
var ranged_damage = 0.0 setget set_ranged_damage, get_ranged_damage
var elemental_damage = 0.0 setget set_elemental_damage, get_elemental_damage
var attack_speed = 0.0 setget set_attack_speed, get_attack_speed
var crit_chance = 0.0 setget set_crit_chance, get_crit_chance
var engineering = 0.0 setget set_engineering, get_engineering
var attack_range = 0.0 setget set_attack_range, get_attack_range
var armor = 0.0 setget set_armor, get_armor
var dodge = 0.0 setget set_dodge, get_dodge
var speed = 0.0 setget set_speed, get_speed
var luck = 0.0 setget set_luck, get_luck
var harvesting = 0.0 setget set_harvesting, get_harvesting

var experience = 0.0 setget set_experience, get_experience
var money = 0.0 setget set_money, get_money
var hp setget set_hp, get_hp

var _horizontal: float
var _vertical: float
var _velocity: Vector2

onready var weapon_manager = get_node(weapon_manager_path)
onready var attack_timer = get_node(attack_timer_path)
onready var items = get_node(items_path)

func _ready() -> void:
	attack_timer.wait_time = 1/self.attack_speed
	self.health = self.max_health
	
func _physics_process(delta: float) -> void:
	_apply_movement(delta)

func _apply_movement(_delta: float) -> void:
	_horizontal = (
		Input.get_action_strength("right") - Input.get_action_strength("left")
	)
	_vertical =(
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	_velocity.x = _horizontal
	_velocity.y = _vertical
	_velocity = _velocity.normalized() * self.movement_speed
	_velocity = move_and_slide(_velocity)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		add_weapon(weapon_scene)

func add_weapon(_weapon_scene: PackedScene):
	weapon_manager.add_weapon(_weapon_scene)

func recieve_damage(damage: float) -> void:
	self.health = self.health - damage
	if self.health <= 0:
		die()

func die() -> void:
	queue_free()

func set_max_hp(value: float) -> void:
	max_hp = value

func get_max_hp() -> float:
	return max_hp

func set_hp_regen(value: float) -> void:
	hp_regen = value

func get_hp_regen() -> float:
	return hp_regen

func set_lifesteal(value: float) -> void:
	lifesteal = value

func get_lifesteal() -> float:
	return lifesteal

func set_damage(value: float) -> void:
	damage = value

func get_damage() -> float:
	return damage

func set_meele_damage(value: float) -> void:
	meele_damage = value

func get_meele_damage() -> float:
	return meele_damage

func set_ranged_damage(value: float) -> void:
	ranged_damage = value

func get_ranged_damage() -> float:
	return ranged_damage

func set_elemental_damage(value: float) -> void:
	elemental_damage = value

func get_elemental_damage() -> float:
	return elemental_damage

func set_attack_speed(value: float) -> void:
	attack_speed = value

func get_attack_speed() -> float:
	return attack_speed

func set_crit_chance(value: float) -> void:
	crit_chance = value

func get_crit_chance() -> float:
	return crit_chance

func set_engineering(value: float) -> void:
	engineering = value

func get_engineering() -> float:
	return engineering

func set_attack_range(value: float) -> void:
	attack_range = value

func get_attack_range() -> float:
	return attack_range

func set_armor(value: float) -> void:
	armor = value

func get_armor() -> float:
	return armor

func set_dodge(value: float) -> void:
	dodge = value

func get_dodge() -> float:
	return dodge

func set_speed(value: float) -> void:
	speed = value

func get_speed() -> float:
	return speed
	
func set_luck(value: float) -> void:
	luck = value

func get_luck() -> float:
	return luck

func set_harvesting(value: float) -> void:
	harvesting = value

func get_harvesting() -> float:
	return harvesting

func set_experience(value: float) -> void:
	experience = value

func get_experience() -> float:
	return experience

func set_money(value: float) -> void:
	money = value

func get_money() -> float:
	return money#

func set_hp(value: float) -> void:
	hp = value

func get_hp() -> float:
	return hp

func _on_AttackTimer_timeout() -> void:
	if weapon_manager.has_method("fire"):
			weapon_manager.fire()

func _on_LootRange_area_entered(area: Area2D) -> void:
	if area.owner.has_method("get_experience_value"):
		self.experience += area.owner.get_experience_value()
		area.owner.queue_free()
