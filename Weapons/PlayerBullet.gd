extends KinematicBody2D

var velocity: Vector2
var damage: float

func init(start_position: Vector2, start_rotation, speed: float, direction: Vector2) -> void:
	global_position = start_position
	rotation = start_rotation
	velocity = direction * speed
	damage = 10.0

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)

func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.owner.has_method("recieve_damage"):
		area.owner.recieve_damage(damage)
	
	queue_free()
