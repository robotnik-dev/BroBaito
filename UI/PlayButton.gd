extends Button

func _on_PlayButton_pressed() -> void:
	SignalHandler.emit_signal("playbutton_pressed")
