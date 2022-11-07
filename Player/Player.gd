extends KinematicBody2D
class_name Player

var _velocity: Vector2
var _horizontal: float
var _vertical: float
export(PackedScene) var weapon_scene

export(NodePath) var attack_timer_path
onready var attack_timer: Timer = get_node(attack_timer_path)

export(NodePath) var weapon_manager_path
onready var weapon_manager = get_node(weapon_manager_path)

export(float) var movement_speed = 200.0 setget set_movement_speed, get_movement_speed
export(float) var attack_speed = 20.0 setget set_attack_speed, get_attack_speed
export(float) var health setget set_health, get_health
export(float) var max_health = 100.0 setget set_max_health, get_max_health
export(float) var experience = 0.0 setget set_experience, get_experience
export(float) var money = 0.0 setget set_money, get_money


func set_movement_speed(value: float) -> void:
	movement_speed = value

func get_movement_speed() -> float:
	return movement_speed
	
func set_attack_speed(value: float) -> void:
	attack_speed = value
	attack_timer.wait_time = 1/attack_speed
	

func get_attack_speed() -> float:
	return attack_speed
	
func set_health(value: float) -> void:
	health = value

func get_health() -> float:
	return health

func set_max_health(value: float) -> void:
	max_health = value

func get_max_health() -> float:
	return max_health

func set_experience(value: float) -> void:
	experience = value

func get_experience() -> float:
	return experience

func set_money(value: float) -> void:
	money = value

func get_money() -> float:
	return money

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

func _on_AttackTimer_timeout() -> void:
	if weapon_manager.has_method("fire"):
			weapon_manager.fire()

func _on_LootRange_area_entered(area: Area2D) -> void:
	if area.owner.has_method("get_experience_value"):
		self.experience += area.owner.get_experience_value()
		area.owner.queue_free()
