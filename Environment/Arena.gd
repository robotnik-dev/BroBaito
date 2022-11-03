extends Node2D

var size: Vector2 setget ,get_size

func get_size() -> Vector2:
	return $Sprite.texture.get_size() * $Sprite.transform.get_scale()
