extends KinematicBody2D
class_name Enemy

export(PackedScene) var loot_scene
export(NodePath) var health_bar_path
export(NodePath) var anim_path
export(float) var max_health = 100.0
export(float) var hit_damage = 1.0
export(float) var speed = 100.0
export(float) var attack_speed = 1.0

var health: float
var spawned: bool = false
var velocity: Vector2 = Vector2.ZERO
var damagable: Array
var player

onready var anim: AnimationPlayer = get_node(anim_path)
onready var health_bar: ProgressBar = get_node(health_bar_path)

func init(spawn_location: Vector2) -> void:
	global_position = spawn_location

func _ready() -> void:
	health = max_health
	health_bar.max_value = max_health
	health_bar.value = health
	$AttackSpeed.wait_time = 1 / attack_speed
	var player_list = get_tree().get_nodes_in_group("player")
	if player_list:
		player = player_list[0]
	anim.play("Spawn")

func _physics_process(_delta: float) -> void:
	if spawned:
		move_to_player()

# DEBUG
func in_range():
	$DEBUG.in_range()

func out_of_range():
	$DEBUG.out_of_range()

func move_to_player() -> void:
	if is_instance_valid(player):
		if player.is_inside_tree():
			var direction = (player.global_position - global_position).normalized()
			velocity = direction
			velocity = move_and_slide(velocity * speed)

func recieve_damage(damage: float) -> void:
	health = health - damage
	health_bar.value = health
	if health <= 0:
		die()

func die() -> void:
	drop_loot()
	queue_free()

func drop_loot() -> void:
	var loot = loot_scene.instance()
	loot.global_position = global_position
	var world = get_tree().get_nodes_in_group("world")
	world[0].call_deferred("add_child", loot)

func spawn() -> void:
	spawned = true

func _on_EnemyHitBox_area_entered(area: Area2D) -> void:
	if area.owner.has_method("recieve_damage"):
		area.owner.recieve_damage(hit_damage)
		damagable.append(area.owner)
		$AttackSpeed.start()

func _on_EnemyHitBox_area_exited(area: Area2D) -> void:
	var idx = damagable.find(area.owner)
	if idx != -1:
		$AttackSpeed.stop()
		damagable.remove(idx)

func _on_AttackSpeed_timeout() -> void:
	if damagable:
		for foe in damagable:
			foe.recieve_damage(hit_damage)

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	match anim_name:
		"Spawn":
			spawn()
