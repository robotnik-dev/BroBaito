extends Node2D

var size: Vector2 setget , get_size

func get_size() -> Vector2:
	return $Ground.texture.get_size() * $Ground.transform.get_scale()

func _ready() -> void:
	$CameraLimits.send_limits()
