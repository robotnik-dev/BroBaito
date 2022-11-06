extends Control

export(PackedScene) var start_screen_scene
onready var start_screen = start_screen_scene.instance()

export(PackedScene) var player_selection_scene
onready var player_selection = player_selection_scene.instance()

export(PackedScene) var wave_ui_scene
onready var wave_ui = wave_ui_scene.instance()

export(PackedScene) var levelup_scene
onready var levelup = levelup_scene.instance()

export(PackedScene) var shop_scene
onready var shop = shop_scene.instance()

export(PackedScene) var game_over_scene
onready var game_over = game_over_scene.instance()

enum UI {
	DEFAULT,
	STARTSCREEN,
	PLAYERSELECTION,
	WAVE,
	LEVELUP,
	SHOP,
	GAMEOVER
}

var current: int = UI.DEFAULT

func startscreen() -> void:
	_remove_current()
	
	add_child(start_screen)
	current = UI.STARTSCREEN

func player_selection() -> void:
	_remove_current()

	add_child(player_selection)
	current = UI.PLAYERSELECTION

func start_wave(wave: int, character: Resource) -> void:
	_remove_current()
	
	add_child(wave_ui)
	wave_ui.wave = wave
	wave_ui.character = character
	current = UI.WAVE

func levelup_selection() -> void:
	_remove_current()

	add_child(levelup)
	current = UI.LEVELUP

func end_wave(_wave: int) -> void:
	_remove_current()

func shop() -> void:
	_remove_current()
	
	add_child(shop)
	current = UI.SHOP

func game_over() -> void:
	_remove_current()
	
	add_child(game_over())
	current = UI.GAMEOVER

func _remove_current() -> void:
	match current:
		UI.STARTSCREEN:
			remove_child(start_screen)
		UI.PLAYERSELECTION:
			remove_child(player_selection)
		UI.WAVE:
			remove_child(wave_ui)
		UI.LEVELUP:
			remove_child(levelup)
		UI.SHOP:
			remove_child(shop)
		UI.GAMEOVER:
			remove_child(game_over)
