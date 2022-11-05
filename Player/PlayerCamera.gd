extends Camera2D


func _ready() -> void:
	SignalHandler.connect("camera_limit_set", self, "_on_camera_limit_set")


func _on_camera_limit_set(node_name: String, pos: Vector2) -> void:
	match node_name:
		"Left":
			limit_left = pos.x
		"Right":
			limit_right = pos.x
		"Top":
			limit_top = pos.y
		"Bottom":
			limit_bottom = pos.y
		
