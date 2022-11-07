tool
extends Control

signal start_game_pressed

export(NodePath) var play_button_path

onready var play_button: Button = get_node(play_button_path)


func _ready() -> void:
	play_button.connect("pressed", self, "_on_play_button_pressed")

func _on_play_button_pressed() -> void:
	emit_signal("start_game_pressed")

func _get_configuration_warning() -> String:
	var warning = ""
	if play_button_path == "":
		warning = "Assign Path to PlayButton"
	return warning
