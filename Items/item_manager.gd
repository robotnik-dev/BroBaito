extends Node

var item_scene = preload("res://Items/Item.tscn")

func add_item(item_data: Resource) -> void:
	var item = item_scene.instance()
	item.init(item_data)
	add_child(item)
