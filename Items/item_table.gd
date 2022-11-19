class_name ItemTable
extends Resource

var path_to_items = "res://Items/resources/"
export var data: Dictionary

func _init():
	var files = Utils.files_in_directory(path_to_items)
	for item_file in files:
		var item = ResourceLoader.load(path_to_items + item_file)
		data[item.item_name] = item

	print(data)
