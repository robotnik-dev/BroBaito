extends CanvasLayer

export(NodePath) var experience_path
export(NodePath) var health_path

onready var experience = get_node(experience_path)
onready var health = get_node(health_path)

var player_stats: Resource = preload("res://Player/player_stats.tres")

func _ready():
	player_stats.connect("attribute_changed", self, "_on_attribute_changed")

func _on_attribute_changed(attribute: String, value: float) -> void:
	match attribute:
		"hp":
			health.value = value
		"experience":
			experience.value = value

func reset() -> void:
	health.max_value = player_stats.max_hp
	health.value = player_stats.hp
