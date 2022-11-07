extends ProgressBar

func _ready() -> void:
	pass

func _on_attribute_changed(attribute: String, _value: float) -> void:
	if attribute == "max_health":
		max_value = _value
	elif attribute == "health":
		value = _value
