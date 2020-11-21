extends Node2D

export (NodePath) var body_path
export (NodePath) var gun_system_path
onready var body: RigidBody2D = get_node(body_path)
onready var gun_system = get_node(gun_system_path)
onready var detection_area = $DetectionArea

var velocity = 100;
var target : RigidBody2D

func _process(_delta):
	if is_instance_valid(target):
		print("freja")
		body.apply_impulse(Vector2.ZERO, target.global_position - body.global_position * 1)


func _ready():
	detection_area.connect("body_entered", self, "_on_body_entered")
	detection_area.connect("body_exited", self, "_on_body_exited")

func _on_body_entered(body_entering: RigidBody2D):
	print(body_entering.global_position)
	target = body_entering;
	gun_system.aim(body_entering.global_position - global_position)
	gun_system.shoot()

func _on_body_exited(_body_entering: RigidBody2D):
	target = null


