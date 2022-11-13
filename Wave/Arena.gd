extends Node2D

var size setget ,get_size
var camera_limits: Array setget ,get_camera_limits

func get_size() -> Vector2:
	return $Ground.texture.get_size() * $Ground.transform.get_scale()

func get_camera_limits() -> Array:
	var _limits:Array = []
	var left: float = $LeftLimit.global_position.x
	var right: float = $RightLimit.global_position.x
	var top: float = $TopLimit.global_position.y
	var bottom: float = $BottomLimit.global_position.y
	
	_limits.append(left)
	_limits.append(right)
	_limits.append(top)
	_limits.append(bottom)
	
	return _limits
	
