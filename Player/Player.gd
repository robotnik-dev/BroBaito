extends KinematicBody2D

var _velocity: Vector2
var _horizontal: float
var _vertical: float
onready var attack_timer = $AttackTimer
export(PackedScene) var weapon_scene

export(float) var movement_speed = 200.0 setget set_movement_speed, get_movement_speed
export(float) var attack_speed = 20.0 setget set_attack_speed, get_attack_speed
export(float) var health setget set_health, get_health
export(float) var max_health = 100.0 setget set_max_health, get_max_health


func set_movement_speed(value: float) -> void:
	movement_speed = value
	SignalHandler.emit_signal("attribute_changed", "movement_speed", value)

func get_movement_speed() -> float:
	return movement_speed
	
func set_attack_speed(value: float) -> void:
	attack_speed = value
	attack_timer.wait_time = 1/attack_speed
	SignalHandler.emit_signal("attribute_changed", "attack_speed", value)

func get_attack_speed() -> float:
	return attack_speed
	
func set_health(value: float) -> void:
	health = value
	SignalHandler.emit_signal("attribute_changed", "health", value)

func get_health() -> float:
	return health

func set_max_health(value: float) -> void:
	max_health = value
	SignalHandler.emit_signal("attribute_changed", "max_health", value)
	
func get_max_health() -> float:
	return max_health

func _ready() -> void:
	attack_timer.wait_time = 1/self.attack_speed
	self.health = self.max_health
	
func _physics_process(delta: float) -> void:
	_apply_movement(delta)

func _apply_movement(delta: float) -> void:
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
	$WeaponManager.add_weapon(_weapon_scene)

func recieve_damage(damage: float) -> void:
	self.health = self.health - damage
	if self.health <= 0:
		die()

func die() -> void:
	queue_free()

func _on_AttackTimer_timeout() -> void:
	if $WeaponManager.has_method("fire"):
			$WeaponManager.fire()


