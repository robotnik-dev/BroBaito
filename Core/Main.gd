extends Node

export(NodePath) var world_path
export(NodePath) var gui_path

onready var world = get_node(world_path)
onready var gui = get_node(gui_path)

func _ready() -> void:
	gui.connect("selection_done", world, "_on_selection_done")
	world.connect("player_died", gui, "_on_player_died")
	gui.show_startscreen()
