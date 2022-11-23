extends Node

export(NodePath) var world_path
export(NodePath) var gui_path

var db: GDDatabase = preload("res://data/brobaitoDB.tres")

onready var world = get_node(world_path)
onready var gui = get_node(gui_path)

func _ready() -> void:
	gui.init(world)
	gui.connect("selection_done", world, "_on_selection_done")
	world.connect("player_died", gui, "_on_player_died")
	world.connect("wave_cleared", gui, "_on_wave_cleared")
	gui.show_startscreen()
	
	var item_table = db.get_table("Items")
	for idx in item_table.get_row_count():
		var item = item_table.get_row_by_index(idx)
		var item_name = item.get("Name")
		print(item_name)
