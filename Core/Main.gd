extends Node

export(NodePath) var world_path
export(NodePath) var gui_path

onready var world = get_node(world_path)
onready var gui = get_node(gui_path)

func _ready() -> void:
	world.hide()
	gui.show_startscreen()
