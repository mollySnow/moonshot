extends Node2D

export (NodePath) var body_path
export (NodePath) var gun_system_path
onready var body: RigidBody2D = get_node(body_path)
onready var gun_system = get_node(gun_system_path)
onready var aim = $Sprite

var mutex
var velocity = 100;
var target : RigidBody2D
var target_position: Vector2 = position

enum State {
	IDLE,
	MOVE,
	SHOOT,
}

var count = 0
var state = State.IDLE

func _process_idle(_delta):
	if body.linear_velocity.length() < 1:
		body.apply_central_impulse(-body.linear_velocity * 10)

func _process_move(_delta):
	var r = 200 
	if is_instance_valid(target):
		target_position = target.global_position.direction_to(body.global_position) * r + target.global_position
		aim.global_position = target_position

	if r > target_position.distance_to(body.global_position):
		return
	body.apply_central_impulse(body.global_position.direction_to(target_position) * 10)

func _process_shoot(_delta):
	if not is_instance_valid(target):
		state = State.IDLE
		return

	gun_system.aim(global_position.direction_to(target.global_position))
	gun_system.shoot()

func _process(_delta):
	match state:
		State.IDLE:  _process_idle(_delta)
		State.MOVE:  _process_move(_delta)
		State.SHOOT: _process_shoot(_delta)

func _ready():
	mutex = Mutex.new()

func on_body_entered(body_entering: RigidBody2D):
	state = State.MOVE
	target = body_entering

func on_body_exited(_body_entering: RigidBody2D):
	target = null


