class_name PlayerBullet
extends KinematicBody2D

var owning_weapon
var velocity: Vector2
var damage: float

func init(
		_start_position: Vector2,
		_start_rotation,
		_speed: float,
		_direction: Vector2,
		_damage: float
		) -> void:
	global_position = _start_position
	rotation = _start_rotation
	velocity = _direction * _speed
	damage = _damage

func _physics_process(delta: float) -> void:
	var _col = move_and_collide(velocity * delta)

func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.owner.has_method("recieve_damage"):
		area.owner.recieve_damage(damage)
