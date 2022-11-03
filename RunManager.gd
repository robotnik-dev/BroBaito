extends Node2D

export(NodePath) var wave_manager_path
onready var wave_manager = get_node(wave_manager_path)

func _ready() -> void:
	_on_run_started()
#	SignalHandler.connect("run_started", self, "_on_run_started")

func _on_run_started() -> void:
	wave_manager.start_wave()

