extends TextureButton

export(Resource) var character

func _get_configuration_warning() -> String:
	#FIXME
	var warning = ""
	if character:
		warning = "Assign a character resource"
	return warning
