extends Node
signal gun_shot
var signal_gun_shot = "gun_shot"

func gun_shot_emit(v,f):
	emit_signal("gun_shot", v, f)

func gun_shot_connect(obj, f_name):
	var _connected = connect("gun_shot", obj, f_name)
