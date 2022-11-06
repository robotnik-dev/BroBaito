extends Control

func _on_LevelUpFinished_pressed() -> void:
	SignalHandler.emit_signal("levelup_finished")
