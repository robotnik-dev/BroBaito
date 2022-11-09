extends Node2D

var size setget ,get_size

func get_size() -> Vector2:
	return $Ground.texture.get_size() * $Ground.transform.get_scale()
