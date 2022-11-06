extends CanvasLayer

var wave : int setget set_wave, get_wave
var character : Resource setget set_character, get_character

export(NodePath) var wave_label_path
onready var wave_label: Label = get_node(wave_label_path)

func set_wave(value: int) -> void:
	wave = value
	wave_label.text = "Wave: " + String(value)

func get_wave() -> int:
	return wave

func set_character(value: Resource) -> void:
	character = value

func get_character() -> Resource:
	return character
