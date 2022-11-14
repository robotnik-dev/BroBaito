class_name Player

extends KinematicBody2D

signal died

export(PackedScene) var weapon_scene
export(NodePath) var weapon_manager_path
export(Resource) var stats

var get_camera_limits

var _horizontal: float
var _vertical: float
var _velocity: Vector2

onready var weapon_manager = get_node(weapon_manager_path)
onready var camera = $Camera2D
onready var item_manager = $ItemManager

func init(selection: Dictionary) -> void:
	# TODO: add_item
	# TODO: add_start_weapon
	add_item(selection.get("character"))
	set_camera_limits()

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	_apply_movement(delta)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		add_weapon(weapon_scene)

func set_camera_limits() -> void:
	var limits = get_camera_limits.call_func()
	camera.limit_left = limits[0]
	camera.limit_right = limits[1]
	camera.limit_top = limits[2]
	camera.limit_bottom = limits[3]

func activate_camera(value: bool) -> void:
	camera.current = value

func add_weapon(_weapon_scene: PackedScene) -> void:
	weapon_manager.add_weapon(_weapon_scene)

func add_item(item: Resource) -> void:
	item_manager.add_item(item)

func recieve_damage(damage: float) -> void:
	stats.hp -= damage
	if stats.hp <= 0:
		die()

func die() -> void:
	weapon_manager.delete_all_weapons()
	emit_signal("died")

func reset_stats() -> void:
	stats.reset()

func _apply_movement(_delta: float) -> void:
	_horizontal = (
		Input.get_action_strength("right") - Input.get_action_strength("left")
	)
	_vertical =(
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	_velocity.x = _horizontal
	_velocity.y = _vertical
	_velocity = _velocity.normalized() * stats.speed
	_velocity = move_and_slide(_velocity)

func _on_LootRange_area_entered(area: Area2D) -> void:
	if area.owner.has_method("get_experience_value"):
		stats.experience += area.owner.get_experience_value()
		area.owner.queue_free()

func _on_Timer_timeout() -> void:
	return
	print("damage: " + String(stats.damage))
