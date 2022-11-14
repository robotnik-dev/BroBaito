class_name Item
extends Node

var _player_stats = preload("res://Player/player_stats.tres")
var _item_data: Resource

func init(item_data) -> void:
	_item_data = item_data

func _ready() -> void:
	add_bonuses()

func add_bonuses() -> void:
	for key in _item_data.modifier.keys():
		var value = _item_data.modifier[key]
		_player_stats.add_bonus(key, value)
