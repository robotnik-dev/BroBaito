extends TextureButton

export(PackedScene) var tooltip_scene

var character_data: Item
var character: Dictionary

var _tooltip_offset_y := 10.0


func _make_custom_tooltip(for_text: String) -> Control:
	var tooltip: Panel = tooltip_scene.instance()
	#TODO
	tooltip.get_node("Tooltip").get_child(0).text
	return tooltip
