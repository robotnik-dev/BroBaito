extends Node2D

export(NodePath) var left_path
onready var left = get_node(left_path)

export(NodePath) var right_path
onready var right = get_node(right_path)

export(NodePath) var top_path
onready var top = get_node(top_path)

export(NodePath) var bottom_path
onready var bottom = get_node(bottom_path)

func send_limits() -> void:
	
	SignalHandler.emit_signal("camera_limit_set", left.name, left.global_position)


	SignalHandler.emit_signal("camera_limit_set", right.name, right.global_position)


	SignalHandler.emit_signal("camera_limit_set", top.name, top.global_position)


	SignalHandler.emit_signal("camera_limit_set", bottom.name, bottom.global_position)

