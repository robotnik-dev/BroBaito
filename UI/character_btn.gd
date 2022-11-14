tool
extends TextureButton

export(Resource) var character_data


func _ready() -> void:
	texture_normal = character_data.image

