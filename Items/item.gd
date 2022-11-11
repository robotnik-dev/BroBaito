tool
class_name Item
extends Control

signal character_selected

export(Resource) var item_data
var player_stats = preload("res://Player/player_stats.tres")

func _ready() -> void:
	if Engine.editor_hint:
		size_flags_horizontal = SIZE_EXPAND_FILL
		size_flags_vertical = SIZE_EXPAND_FILL
		if get_child_count() <= 0:
			var btn = TextureButton.new()
			add_child(btn)
			if item_data:
				btn.texture_normal = item_data.image
			btn.expand = true
			btn.set_owner(get_tree().edited_scene_root)
			btn.set_anchors_and_margins_preset(Control.PRESET_WIDE)
		else:
			var btn = get_child(0)
			if item_data:
				btn.texture_normal = item_data.image
			btn.expand = true

	if not Engine.editor_hint:
		var btn = get_child(0)
		add_bonuses()
		btn.connect("pressed", self, "_on_button_pressed")

func add_bonuses() -> void:
	for key in item_data.modifier.keys():
		var value = item_data.modifier[key]
		player_stats.add_bonus(key, value)


func _on_button_pressed() -> void:
	var player = get_tree().get_nodes_in_group("player")[0]
#	var item_scene = load(get_tree().edited_scene_root.filename)
	player.add_item(self)
	emit_signal("character_selected")
