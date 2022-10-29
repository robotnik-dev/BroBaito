extends KinematicBody2D

export(NodePath) var health_bar_path
onready var health_bar: ProgressBar = get_node(health_bar_path)

export(float) var max_health = 100.0
var health: float
export(float) var hit_damage = 10.0

var player

var velocity: Vector2 = Vector2.ZERO
export(float) var speed = 100.0

func init(spawn_location: Vector2) -> void:
	global_position = spawn_location


func _ready() -> void:
	health = max_health
	health_bar.max_value = max_health
	health_bar.value = health
	player = get_tree().get_nodes_in_group("player")[0]

func _physics_process(delta: float) -> void:
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction
		velocity = move_and_slide(velocity * speed)


func recieve_damage(damage: float) -> float:
	health = health - damage
	health_bar.value = health
	if health <= 0:
		queue_free()
	
	return damage


func _on_EnemyHitBox_area_entered(area: Area2D) -> void:
	if area.owner.has_method("recieve_damage"):
		area.owner.recieve_damage(hit_damage)
