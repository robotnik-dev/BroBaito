tool
extends Control

signal character_selected(character)

export(NodePath) var character_container_path

onready var character_container = get_node(character_container_path)

func _ready() -> void:
	for btn in character_container.get_children():
		btn.connect("pressed", self, "_on_character_button_pressed",[btn])

func _on_character_button_pressed(btn) -> void:
	emit_signal("character_selected", btn.character)

func _get_configuration_warning() -> String:
	var warning = ""
	if character_container_path == "":
		warning = "Assign Path to Characters"
	return warning
