class_name BulletSystem 
extends Node2D

onready var bullet_packed: PackedScene  = preload("res://nodes/bullet/bullet.tscn")

func _ready():
	Signals.gun_shot_connect(self, "_on_gun_shot")

func _on_gun_shot(v: Vector2, p: Vector2, _t: int):
	new_bullet("normal", v, p)

func new_bullet(_type, velocity: Vector2, spawn_point: Vector2) -> void:
	var bullet = bullet_packed.instance()
	bullet.set_name("bullet")
	add_child(bullet)
	bullet.global_position = spawn_point
	bullet.linear_velocity = velocity
	bullet.rotation = velocity.angle()
