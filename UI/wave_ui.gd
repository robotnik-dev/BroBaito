extends CanvasLayer

var _remaining_time

onready var hud = $HUD
onready var time = $Time

func _process(delta: float) -> void:
	time.text = String(ceil(_remaining_time.call_func()))

func reset() -> void:
	hud.reset()
