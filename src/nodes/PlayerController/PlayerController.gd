extends Node2D

export (NodePath) var body_path
export (NodePath) var gun_system_path
onready var body = get_node(body_path)
onready var gun_system = get_node(gun_system_path)

func _process(_delta):
	gun_system.aim(get_global_mouse_position() - gun_system.global_position)
	if Input.is_action_just_pressed("ui_accept"):
		body.apply_impulse(Vector2.ZERO, gun_system.shoot())
		
