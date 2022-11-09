extends Control

signal new_game_pressed

func _on_Button_pressed() -> void:
	emit_signal("new_game_pressed")
