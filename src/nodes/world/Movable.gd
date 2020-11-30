extends RigidBody2D

onready var tween: Tween = $Tween
onready var aim: Sprite = $Aim

var target_global_position = Vector2.ZERO

export (int) var max_speed = 10

var count = 0
func _integrate_forces(state):
	count += 1
	print(count)
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		print("hello")
		var mouse_pos = get_global_mouse_position()
		var distance = mouse_pos.distance_to(global_position)
		var _r = tween.interpolate_property(state, "position", global_position, mouse_pos, distance / max_speed,  Tween.TRANS_QUINT, Tween.EASE_OUT)
		_r = tween.start()