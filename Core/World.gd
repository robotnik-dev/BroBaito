extends Node2D

export(PackedScene) var wave_scene
onready var wave = wave_scene.instance()

func start_wave(_wave: int, character: Resource) -> void:
	# TODO: character assigned not good
	wave.wave = _wave
	wave.character = character
	add_child(wave)
	wave.start()

func end_wave(_wave: int) -> void:
	wave.stop()
	remove_child(wave)
