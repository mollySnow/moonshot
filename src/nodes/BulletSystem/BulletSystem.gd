class_name BulletSystem 
extends Node2D

onready var bullet_packed: PackedScene  = preload("res://nodes/bullet/bullet.tscn")

func new_bullet(_type, velocity: Vector2, spawn_point: Position2D) -> void:
	var bullet = bullet_packed.instance()
	bullet.set_name("bullet")
	add_child(bullet)
	bullet.global_position = spawn_point.global_position
	bullet.linear_velocity = velocity
	bullet.rotation = velocity.angle()
