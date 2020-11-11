extends Node2D

export (NodePath) var orbit_node_path
export (NodePath) var bullet_layer_path

onready var bullet_packed = preload("res://nodes/bullet/bullet.tscn")

onready var orbit = get_node(orbit_node_path)
onready var bullet_layer = get_node(bullet_layer_path)
onready var gravity_orbit = $GravityFieldOrbit

onready var body = $MoonBody
onready var gun_root = $MoonBody/GunRoot
onready var bullet_spawn_point = $MoonBody/GunRoot/BulletSpawnPoint

export var force = 2;


func _process(_delta):
	gravity_orbit.rotation = body.position.angle()

	if Input.is_action_pressed("lmb"):
		var rot = body.get_local_mouse_position().normalized().angle()
		print("mouse angle: ", rot, " body rot: ", body.global_rotation)
		body.apply_torque_impulse(rot * 100)
	if Input.is_action_just_pressed("ui_accept"):
		_shoot_gun()


func _shoot_gun():
	var direction = (bullet_spawn_point.global_position - body.global_position).normalized()
	var boom = 500
	var bullet = bullet_packed.instance()
	bullet.set_name("bullet")
	bullet_layer.add_child(bullet)
	bullet.global_position = bullet_spawn_point.global_position
	bullet.linear_velocity = direction * boom
	bullet.rotation = direction.angle()
	body.apply_central_impulse(-(bullet_spawn_point.global_position - body.global_position) * force)
