extends Node2D

export(int, 1, 20) var wave_number
export(PackedScene) var wave_scene

func start_wave() -> void:
	var wave = wave_scene.instance()
	wave.init(wave_number)
	add_child(wave)
