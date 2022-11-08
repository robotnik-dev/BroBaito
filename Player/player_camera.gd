extends Camera2D


func _ready() -> void:
	pass


func _on_camera_limit_set(node_name: String, pos: Vector2) -> void:
	match node_name:
		"Left":
			limit_left = int(pos.x)
		"Right":
			limit_right = int(pos.x)
		"Top":
			limit_top = int(pos.y)
		"Bottom":
			limit_bottom = int(pos.y)
		
