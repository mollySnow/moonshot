extends Node2D

export (NodePath) var body_path
onready var body: RigidBody2D = get_node(body_path)
onready var aim = $Aim

var target: RigidBody2D
var target_global_position: Vector2
var max_speed = 500;
var acc = 40;
var dacc = 40;
var direction_to_target

var breaking = false


enum State { IDLE, ACC, BREAK, MARCH, STOP }
var current_state = State.IDLE

func _process(_delta):
	aim.global_position = target_global_position
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		target_global_position = get_global_mouse_position()


func _physics_process(_delta):
	var direction = body.global_position.direction_to(target_global_position)
	var distance = body.global_position.distance_to(target_global_position)
	match current_state:
		State.IDLE:
			if distance > 100: 
				current_state = State.ACC
		State.BREAK:
			body.add_central_force(body.linear_velocity.normalized() * -dacc)
			current_state = State.STOP
		State.ACC:
			body.add_central_force(direction * acc)
			current_state = State.MARCH
		State.MARCH:
			if distance < 100:
				current_state = State.BREAK
		State.STOP:
			if distance < 10:
				pass

func _ready():
	target_global_position = global_position

func on_body_entered(body_entering: RigidBody2D):
	target = body_entering
	target_global_position = target.global_position

func on_body_exited(_body_entering: RigidBody2D):
	target = null