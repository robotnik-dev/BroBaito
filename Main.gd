extends Node

export(PackedScene) var start_screen_scene
onready var start_screen = start_screen_scene.instance()

export(PackedScene) var wave_scene
onready var wave = wave_scene.instance()

export(NodePath) var world_path
onready var world = get_node(world_path)

export(NodePath) var gui_path
onready var gui = get_node(gui_path)


func _ready() -> void:
	SignalHandler.connect("playbutton_pressed", self, "_on_playbutton_pressed")
	
	add_child(start_screen)


func _on_playbutton_pressed() -> void:
	remove_child(start_screen)
	world.add_child(wave)
