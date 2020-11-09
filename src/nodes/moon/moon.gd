extends Node2D

export (NodePath) var orbit_node_path
export (NodePath) var bullet_layer_path
onready var orbit = get_node(orbit_node_path)
onready var bullet_layer = get_node(bullet_layer_path)
onready var body = $RigidBody2D
onready var gravity_orbit = $GravityFieldOrbit

func _ready():
	Signals.gun_shot_connect(self, "_on_Gun_gun_shot")

func _process(_delta):
	gravity_orbit.rotation = body.position.angle()

func _on_Gun_gun_shot(v, force):
	body.apply_central_impulse(v * force)
