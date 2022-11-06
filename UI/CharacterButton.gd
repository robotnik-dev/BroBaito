extends TextureButton

export(Resource) var character

func _on_CharacterButton_pressed() -> void:
	SignalHandler.emit_signal("character_selected", character)
