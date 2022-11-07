extends ProgressBar

func _ready() -> void:
	pass

func _on_attribute_changed(attribute: String, _value: float) -> void:
	if attribute == "experience":
		value = _value
