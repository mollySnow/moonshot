extends RigidBody2D

onready var aim: Sprite = $Aim

var target_global: Vector2 = Vector2.ZERO

var current_force: Vector2 = Vector2.ZERO
var state = State.IDLE
var current_state setget ,get_current_readable_state

func get_current_readable_state():
	return State.keys()[state]

var max_speed = 500
var force = 500 

func _process(_delta):
	aim.global_position = target_global
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		target_global = get_global_mouse_position()

enum State { IDLE, ACC, DACC, MARCH }

func _physics_process(_delta):
	var distance = target_global.distance_to(global_position)
	var direction = global_position.direction_to(target_global)

	match state:
		State.IDLE:
			if distance > 60:
				state = State.ACC
		State.ACC:
			add_central_force(direction * force)
			current_force = direction * force
			state = State.MARCH
		State.MARCH:
			var v = linear_velocity.length()
			if v >= max_speed:
				add_central_force(-current_force)
			if distance < 200:
				add_central_force(direction * -force)
				current_force = direction * -force
				state = State.DACC
		State.DACC:
			var v = linear_velocity.length()
			if v <= 30:
				add_central_force(-current_force)
				state = State.IDLE