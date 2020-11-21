extends Node
signal gun_shot
var signal_gun_shot = "gun_shot"

func gun_shot_emit(velocity: Vector2, bullet: Vector2, type: int):
	emit_signal("gun_shot", velocity, bullet, type)

func gun_shot_connect(obj, f_name):
	var _connected = connect("gun_shot", obj, f_name)
