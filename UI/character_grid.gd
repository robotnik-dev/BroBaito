extends GridContainer

signal character_selected(character_data)

export(PackedScene) var character_btn_scene

var characters: Array

func _ready() -> void:
	characters = Utils.fetch_all_characters_from_db()
	
	for character in characters:
		character = character as Dictionary
		var btn = character_btn_scene.instance()
		var image_path = character.get("Image")
		var texture = load(image_path)
		btn.texture_normal = texture
		var character_data: Item = load(character.get("Data"))
		btn.character_data = character_data
		btn.character = character
		btn.connect("pressed", self, "_on_character_button_pressed", [btn.character_data])
		add_child(btn)

func _on_character_button_pressed(character_data: Item) -> void:
	emit_signal("character_selected", character_data)
