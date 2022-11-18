extends Control

export(NodePath) var labels_path
export(NodePath) var values_path

var player_stats: Resource = preload("res://Player/player_stats.tres")

# [display_name, name, value]
var _attributes: Array

onready var labels = get_node(labels_path)
onready var values = get_node(values_path)

func _ready() -> void:
	player_stats.connect("attribute_bonus_changed", self, "_on_attribute_bonus_changed")
	update_all()

func reset() -> void:
	update_all()

func update_all() -> void:
	_get_attributes()
	_add_labels()
	_update_labels()

func _get_attributes() -> void:
	var stats = player_stats.get_stats()
	_attributes.clear()
	for stat in stats:
		_attributes.append([stat.get("display_name"), stat.get("name"), stat.get("value")])

func _add_labels() -> void:
	if labels.get_child_count() or values.get_child_count():
		return
	for attr in _attributes:
		var label = Label.new()
		label.align = label.ALIGN_CENTER
		label.valign = label.VALIGN_CENTER
		label.hint_tooltip = _get_tooltip_for(attr[1])
		label.mouse_filter = label.MOUSE_FILTER_STOP
		labels.add_child(label)
		
		var value = Label.new()
		value.align = value.ALIGN_CENTER
		value.valign = value.VALIGN_CENTER
		values.add_child(value)

func _get_tooltip_for(attribute: String) -> String:
	var _tooltip = ""
	
	match attribute:
		"max_hp":
			_tooltip = "Maximum Health of Player"
	
	return _tooltip

func _update_labels() -> void:
	if not labels.get_child_count() or not values.get_child_count():
		return
	var idx: int = 0
	for attr in _attributes:
		labels.get_children()[idx].text = attr[0]
		values.get_children()[idx].text = String(attr[2])
		idx += 1

func _update_attribute(_name: String, value: float) -> void:
	for attr in _attributes:
		if _name == attr[1]:
			attr[2] = value
			break
	_update_labels()

func _on_attribute_bonus_changed(_name: String, value: float) -> void:
	_update_attribute(_name, value)

