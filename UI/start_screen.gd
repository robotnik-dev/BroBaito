extends Control

signal start_game_pressed

onready var play_button = $MarginContainer/VBoxContainer/PlayButton

func _ready() -> void:
	play_button.connect("pressed", self, "_on_play_button_pressed")

func _on_play_button_pressed() -> void:
	emit_signal("start_game_pressed")

