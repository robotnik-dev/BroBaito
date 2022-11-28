extends Control

signal character_selected(character_data)


func _on_Characters_character_selected(character_data) -> void:
	emit_signal("character_selected", character_data)
