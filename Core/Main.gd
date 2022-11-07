class_name Main

extends Node

export(NodePath) var world_path
export(NodePath) var gui_path

onready var world = get_node(world_path)
onready var gui = get_node(gui_path)

func _ready() -> void:
	gui.show_startscreen()
