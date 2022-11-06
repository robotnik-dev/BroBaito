extends Node
class_name Main

export(NodePath) var world_path
onready var world = get_node(world_path)

export(NodePath) var gui_path
onready var gui = get_node(gui_path)

var character: Resource

var wave : int setget set_wave, get_wave
var player_leveled: bool = false

func set_wave(value: int) -> void:
	wave = value

func get_wave() -> int:
	return wave

func _ready() -> void:
	SignalHandler.connect("playbutton_pressed", self, "_on_playbutton_pressed")
	SignalHandler.connect("character_selected", self, "_on_character_selected")
	SignalHandler.connect("wave_cleared", self, "_on_wave_cleared")
	SignalHandler.connect("player_leveled", self, "_on_player_leveled")
	SignalHandler.connect("levelup_finished", self, "_on_levelup_finished")
	SignalHandler.connect("shopping_done", self, "_on_shopping_done")
	SignalHandler.connect("game_over", self, "_on_game_over")
	
	startscreen()

func _on_character_selected(_character: Resource) -> void:
	character = _character
	start_wave()

func _on_playbutton_pressed() -> void:
	player_selection()

func _on_wave_cleared() -> void:
	end_wave()

func _on_player_leveled() -> void:
	player_leveled = true

func _on_levelup_finished() -> void:
	shop()

func _on_shopping_done() -> void:
	start_wave()

func _on_game_over() -> void:
	game_over()

func startscreen() -> void:
	gui.startscreen()

func player_selection() -> void:
	gui.player_selection()

func start_wave() -> void:
	gui.start_wave(self.wave, character)
	world.start_wave(self.wave, character)

func end_wave() -> void:
	self.wave += 1
	gui.end_wave(self.wave)
	world.end_wave(self.wave)
	if player_leveled:
		levelup_selection()
		player_leveled = false
	else:
		shop()
	
func levelup_selection() -> void:
	gui.levelup_selection()

func shop() -> void:
	gui.shop()

func game_over() -> void:
	gui.game_over(self.wave)
