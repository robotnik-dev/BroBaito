extends Node

export(NodePath) var world_path
export(NodePath) var gui_path

onready var world = get_node(world_path)
onready var gui = get_node(gui_path)

func _ready() -> void:
	gui.init(world)
	gui.connect("selection_done", world, "_on_selection_done")
	world.connect("player_died", gui, "_on_player_died")
	world.connect("wave_cleared", gui, "_on_wave_cleared")
	gui.show_startscreen()
