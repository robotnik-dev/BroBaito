class_name GUI
extends CanvasLayer

signal selection_done(selection)

enum UI {
	DEFAULT,
	STARTSCREEN,
	PLAYERSELECTION,
	WAVE,
	LEVELUP,
	SHOP,
	GAMEOVER
}

export(PackedScene) var start_screen_scene
export(PackedScene) var player_selection_scene
export(PackedScene) var wave_ui_scene
export(PackedScene) var levelup_scene
export(PackedScene) var shop_scene
export(PackedScene) var game_over_scene

var current: int = UI.DEFAULT
var player_stats: Resource = preload("res://Player/player_stats.tres")
var world

var _selection: Dictionary = {}

onready var _start_screen = start_screen_scene.instance()
onready var _player_selection = player_selection_scene.instance()
onready var _wave_ui = wave_ui_scene.instance()
onready var _levelup = levelup_scene.instance()
onready var _shop = shop_scene.instance()
onready var _game_over = game_over_scene.instance()

func init(_world) -> void:
	_wave_ui._remaining_time = funcref(_world, "get_remaining_wave_time")

func _ready() -> void:
	_start_screen.connect("start_game_pressed", self, "_on_start_game_pressed")
	_player_selection.connect("character_selected", self, "_on_character_selected")
	_game_over.connect("new_game_pressed", self, "_on_new_game_pressed")

func show_startscreen() -> void:
	_remove_current_ui()
	add_child(_start_screen)
	current = UI.STARTSCREEN

func show_player_selection() -> void:
	_remove_current_ui()
	add_child(_player_selection)
	current = UI.PLAYERSELECTION

func show_wave_ui() -> void:
	_remove_current_ui()
	add_child(_wave_ui)
	_wave_ui.reset()
	current = UI.WAVE

func show_levelup_selection() -> void:
	_remove_current_ui()
	add_child(_levelup)
	current = UI.LEVELUP

func show_shop() -> void:
	_remove_current_ui()
	add_child(_shop)
	current = UI.SHOP

func show_game_over() -> void:
	_remove_current_ui()
	add_child(_game_over)
	current = UI.GAMEOVER

func _on_start_game_pressed() -> void:
	show_player_selection()

func _on_new_game_pressed() -> void:
	show_startscreen()

func _on_character_selected(character_data: Resource) -> void:
	# TODO: choose weapon
	# TODO: choose difficulty
	_selection["character"] = character_data
	emit_signal("selection_done", _selection)
	show_wave_ui()

func _on_player_died() -> void:
	show_game_over()

func _on_wave_cleared(wave_number: int) -> void:
	# TODO multiple level ups
	if player_stats.leveled():
		show_levelup_selection()
	else:
		show_shop()

func _remove_current_ui() -> void:
	match current:
		UI.STARTSCREEN:
			remove_child(_start_screen)
		UI.PLAYERSELECTION:
			remove_child(_player_selection)
		UI.WAVE:
			remove_child(_wave_ui)
		UI.LEVELUP:
			remove_child(_levelup)
		UI.SHOP:
			remove_child(_shop)
		UI.GAMEOVER:
			remove_child(_game_over)
