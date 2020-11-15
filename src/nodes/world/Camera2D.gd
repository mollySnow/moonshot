extends Camera2D


export (NodePath) var start_path
onready var start: Node2D = get_node(start_path)
export(int, 1, 20) var camera_move_divider

func _process(_delta):
	if Input.is_key_pressed(KEY_A):
		print("position ", position)
		print("mouse ", get_global_mouse_position())

	global_position = start.global_position + (get_global_mouse_position() - start.global_position) / camera_move_divider
