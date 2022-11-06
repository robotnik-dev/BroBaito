extends Control



func _on_Button_pressed() -> void:
	SignalHandler.emit_signal("game_over")
