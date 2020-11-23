extends Node2D

export (NodePath) var body_path
onready var body: RigidBody2D = get_node(body_path)
onready var aim = $Sprite

var target: RigidBody2D
var target_position: Vector2

func _process(_delta):
	pass


func _ready():
	target_position = global_position

func on_body_entered(body_entering: RigidBody2D):
	target = body_entering
	target_position = target.global_position

func on_body_exited(_body_entering: RigidBody2D):
	target = null

