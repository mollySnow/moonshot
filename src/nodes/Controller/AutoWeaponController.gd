extends Node2D

export (NodePath) var weapon_system_path
onready var weapon_system: WeaponSystem = get_node(weapon_system_path)

var target: RigidBody2D

func _process(_delta):
	if is_instance_valid(target):
		weapon_system.aim(global_position.direction_to(target.global_position))
		weapon_system.shoot()


func on_body_entered(body):
	print("entered")
	target = body

func on_body_exited(_body):
	target = null
