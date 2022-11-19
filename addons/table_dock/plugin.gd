tool
extends EditorPlugin


# A class member to hold the dock during the plugin life cycle.
var dock
var eds = get_editor_interface().get_selection()
var efs = get_editor_interface().get_file_system_dock()
var ins = get_editor_interface().get_inspector()

func _enter_tree():
	# Initialization of the plugin goes here.
	# Load the dock scene and instance it.
	dock = preload("res://addons/table_dock/table_dock.tscn").instance()

	# Add the loaded scene to the docks.
	add_control_to_dock(DOCK_SLOT_RIGHT_UL, dock)
	# Note that LEFT_UL means the left of the editor, upper-left dock.
	eds.connect("selection_changed", self, "_on_selection_changed")
	efs.connect("gui_input", self, "_on_filesystem_changed")
	efs.connect("files_moved", self, "_on_resources_reimported")
	efs.connect("folder_moved", self, "_on_resources_reload")
	efs.connect("folder_removed", self, "_on_sources_changed")
	efs.connect("inherit", self, "_on_inherit")
	efs.connect("instance", self, "_on_instance")
	ins.connect("resource_selected", self, "_on_object_id_selected")


func _exit_tree():
	# Clean-up of the plugin goes here.
	# Remove the dock.
	remove_control_from_docks(dock)
	# Erase the control from the memory.
	dock.free()

func _on_selection_changed() -> void:
	pass
#	print(ins.get_children())
#	var path = get_editor_interface().get_current_path()
#	print(path)
#	var selected = eds.get_selected_nodes()
#	if not selected.empty():
#		dock._on_selection_changed(selected)
	
func _on_filesystem_changed(input: InputEvent) -> void:
	pass
#	var path = get_editor_interface().get_current_path()
#	var _input = input as InputEventMouseButton
#	if _input.doubleclick:
#		print("_on_filesystem_changed")
		
	
func _on_resources_reimported() -> void:
	print("_on_resources_reimported")

func _on_resources_reload() -> void:
	print("_on_resources_reload")

func _on_sources_changed() -> void:
	print("_on_sources_changed")
	
func _on_inherit() -> void:
	print("_on_inherit")
	
func _on_instance() -> void:
	print("_on_instance")

func _on_object_id_selected(id, d) -> void:
	print("_on_object_id_selected")
