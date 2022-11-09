class_name Player

extends KinematicBody2D

signal died

export(PackedScene) var weapon_scene
export(NodePath) var attack_timer_path
export(NodePath) var weapon_manager_path

var max_hp = 10.0 setget set_max_hp, get_max_hp
var hp_regen = 0.0 setget set_hp_regen, get_hp_regen
var lifesteal = 0.0 setget set_lifesteal, get_lifesteal
var damage = 1.0 setget set_damage, get_damage
var meele_damage = 1.0 setget set_meele_damage, get_meele_damage
var ranged_damage = 1.0 setget set_ranged_damage, get_ranged_damage
var elemental_damage = 1.0 setget set_elemental_damage, get_elemental_damage
var attack_speed = 20.0 setget set_attack_speed, get_attack_speed
var crit_chance = 1.0 setget set_crit_chance, get_crit_chance
var engineering = 0.0 setget set_engineering, get_engineering
var attack_range = 100.0 setget set_attack_range, get_attack_range
var armor = 0.0 setget set_armor, get_armor
var dodge = 0.0 setget set_dodge, get_dodge
var speed = 500.0 setget set_speed, get_speed
var luck = 0.0 setget set_luck, get_luck
var harvesting = 0.0 setget set_harvesting, get_harvesting
var hp = 10.0 setget set_hp, get_hp
var experience = 0.0 setget set_experience, get_experience
var money = 0.0 setget set_money, get_money

var max_hp_mp = 1.0
var hp_regen_mp = 1.0
var lifesteal_mp = 1.0
var damage_mp = 1.0
var meele_damage_mp = 1.0
var ranged_damage_mp = 1.0
var elemental_damage_mp = 1.0
var attack_speed_mp = 1.0
var crit_chance_mp = 1.0
var engineering_mp = 1.0
var attack_range_mp = 1.0
var armor_mp = 1.0
var dodge_mp = 1.0
var speed_mp = 1.0
var luck_mp = 1.0
var harvesting_mp = 1.0

var _horizontal: float
var _vertical: float
var _velocity: Vector2

onready var weapon_manager = get_node(weapon_manager_path)
onready var attack_timer = get_node(attack_timer_path)

func _ready() -> void:
	_init_stats()

func _physics_process(delta: float) -> void:
	_apply_movement(delta)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		add_weapon(weapon_scene)

func add_weapon(_weapon_scene: PackedScene):
	weapon_manager.add_weapon(_weapon_scene)

func recieve_damage(damage: float) -> void:
	self.hp = self.hp - damage
	if self.hp <= 0:
		die()

func die() -> void:
	emit_signal("died")

func reset_stats() -> void:
	_init_stats()

func _init_stats() -> void:
	self.max_hp = max_hp
	self.hp_regen = hp_regen
	self.lifesteal = lifesteal
	self.damage = damage
	self.meele_damage = meele_damage
	self.ranged_damage = ranged_damage
	self.elemental_damage = elemental_damage
	self.attack_speed = attack_speed
	self.crit_chance = crit_chance
	self.engineering = engineering
	self.attack_range = attack_range
	self.armor = armor
	self.dodge = dodge
	self.speed = speed
	self.luck = luck
	self.harvesting = harvesting
	self.hp = max_hp

func set_max_hp(value: float) -> void:
	max_hp = value * max_hp_mp

func get_max_hp() -> float:
	return max_hp

func set_hp_regen(value: float) -> void:
	hp_regen = value * hp_regen_mp

func get_hp_regen() -> float:
	return hp_regen

func set_lifesteal(value: float) -> void:
	lifesteal = value * lifesteal_mp

func get_lifesteal() -> float:
	return lifesteal

func set_damage(value: float) -> void:
	damage = value * damage_mp

func get_damage() -> float:
	return damage

func set_meele_damage(value: float) -> void:
	meele_damage = value * meele_damage_mp

func get_meele_damage() -> float:
	return meele_damage

func set_ranged_damage(value: float) -> void:
	ranged_damage = value * ranged_damage_mp

func get_ranged_damage() -> float:
	return ranged_damage

func set_elemental_damage(value: float) -> void:
	elemental_damage = value * elemental_damage_mp

func get_elemental_damage() -> float:
	return elemental_damage

func set_attack_speed(value: float) -> void:
	value = max(0.1, value)
	attack_speed = value * attack_speed_mp
	attack_timer.wait_time = 1 / attack_speed

func get_attack_speed() -> float:
	return attack_speed

func set_crit_chance(value: float) -> void:
	crit_chance = value * crit_chance_mp

func get_crit_chance() -> float:
	return crit_chance

func set_engineering(value: float) -> void:
	engineering = value * engineering_mp

func get_engineering() -> float:
	return engineering

func set_attack_range(value: float) -> void:
	attack_range = value * ranged_damage_mp

func get_attack_range() -> float:
	return attack_range

func set_armor(value: float) -> void:
	armor = value * armor_mp

func get_armor() -> float:
	return armor

func set_dodge(value: float) -> void:
	dodge = value * dodge_mp

func get_dodge() -> float:
	return dodge

func set_speed(value: float) -> void:
	speed = value * speed_mp

func get_speed() -> float:
	return speed
	
func set_luck(value: float) -> void:
	luck = value * luck_mp

func get_luck() -> float:
	return luck

func set_harvesting(value: float) -> void:
	harvesting = value * harvesting_mp

func get_harvesting() -> float:
	return harvesting

func set_experience(value: float) -> void:
	experience = value

func get_experience() -> float:
	return experience

func set_money(value: float) -> void:
	money = value

func get_money() -> float:
	return money

func set_hp(value: float) -> void:
	hp = clamp(value, value, self.max_hp)

func get_hp() -> float:
	return hp

func _apply_movement(_delta: float) -> void:
	_horizontal = (
		Input.get_action_strength("right") - Input.get_action_strength("left")
	)
	_vertical =(
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	_velocity.x = _horizontal
	_velocity.y = _vertical
	_velocity = _velocity.normalized() * self.speed
	_velocity = move_and_slide(_velocity)

func _on_AttackTimer_timeout() -> void:
	if weapon_manager.has_method("fire"):
			weapon_manager.fire()

func _on_LootRange_area_entered(area: Area2D) -> void:
	if area.owner.has_method("get_experience_value"):
		self.experience += area.owner.get_experience_value()
		area.owner.queue_free()
