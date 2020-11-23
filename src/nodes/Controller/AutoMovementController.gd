extends Node2D

export (NodePath) var body_path
onready var body: RigidBody2D = get_node(body_path)
onready var aim = $Sprite

var target_position
var target: RigidBody2D
var max_speed = 20
var min_speed = 0
var distance = 0
var speed = 10 
var acceleration = 10;
var deacceleration = 4;

func _ready():
	target_position = global_position

var count = 0
func _process(delta):
	if !is_instance_valid(target): return
	var r = 300 

	var current_distance = target.global_position.distance_to(body.global_position)

	if  current_distance > r:
		speed += delta * acceleration
	else:
		speed -= delta * deacceleration

	speed = clamp(speed, min_speed, max_speed)

	distance = current_distance

	target_position = target.global_position.direction_to(body.global_position) * r + target.global_position
	aim.global_position = target_position
	body.apply_central_impulse(body.global_position.direction_to(target_position) * speed)

func on_body_entered(body_entering: RigidBody2D):
	target = body_entering

func on_body_exited(_body_entering: RigidBody2D):
	target = null
