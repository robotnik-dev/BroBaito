tool
extends CanvasLayer

signal character_selected(character)

export(NodePath) var character_container_path

onready var character_container = get_node(character_container_path)

func _ready() -> void:
	for btn in character_container.get_children():
		btn.connect("character_selected", self, "_on_character_button_pressed")

func _on_character_button_pressed() -> void:
	emit_signal("character_selected")

func _get_configuration_warning() -> String:
	var warning = ""
	if character_container_path == "":
		warning = "Assign Path to Characters"
	return warning
