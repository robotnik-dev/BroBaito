tool
extends ScrollContainer

var root

func _on_selection_changed(selection) -> void:
	root = selection[0]
#	print(root)
	

func _update_tree() -> void:
	pass
