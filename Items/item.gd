class_name Item
extends Node

export(Resource) var item_data

func _ready() -> void:
	owner.damage += item_data.modifier.get("damage")
	owner.luck += item_data.modifier.get("luck")
