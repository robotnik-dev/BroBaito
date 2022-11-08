extends Node2D

export(NodePath) var wave_path
export(NodePath) var arena_path

onready var wave = get_node(wave_path)
onready var arena = get_node(arena_path)

func _ready():
	wave.init(arena)

func start_wave() -> void:
	wave.start()

func end_wave() -> void:
	wave.stop()
