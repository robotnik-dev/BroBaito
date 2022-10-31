extends ProgressBar

func _ready() -> void:
	SignalHandler.connect("attribute_changed", self, "_on_attribute_changed")

func _on_attribute_changed(attribute: String, _value: float) -> void:
	if attribute == "experience":
		value = _value
