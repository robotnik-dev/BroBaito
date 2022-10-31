extends Node2D

export(float) var experience_value = 10.0 setget set_experience_value, get_experience_value

func get_experience_value() -> float:
	return experience_value

func set_experience_value(value: float) -> void:
	experience_value = value
