extends Node

onready var db: GDDatabase = preload("res://data/brobaitoDB.tres")

func files_in_directory(path) -> Array:
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()

	return files


func fetch_all_characters_from_db() -> Array:
	""" return list of dictionary as in Database"""
	var characters := []
	var item_table = db.get_table("Items")
	
	for row_cnt in item_table.get_row_count():
		var item_id = item_table.get_row_id(row_cnt)
		var is_character: bool = item_table.get_cell_value(item_id, "Character")
		if is_character:
			characters.append(item_table.get_row(item_id))
	return characters

