extends Node2D

func _ready() -> void:
	$CameraLimits.send_limits()
