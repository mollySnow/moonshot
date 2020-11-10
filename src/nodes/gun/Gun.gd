extends Node2D

onready var end_of_barrel = $BarrelEnd
onready var bullet_packed = preload("res://nodes/bullet/bullet.tscn")

export var force = 2;

# Called when the node enters the scene tree for the first time.
var mouse_position = Vector2.ZERO

func shoot():
	var direction = (end_of_barrel.global_position - global_position).normalized()
	var boom = 500
	var bullet = bullet_packed.instance()
	bullet.set_name("why")
	get_parent().get_parent().bullet_layer.add_child(bullet)
	bullet.global_position = end_of_barrel.global_position
	bullet.linear_velocity = direction * boom
	bullet.rotation = direction.angle()
	Signals.gun_shot_emit(-(end_of_barrel.global_position - global_position), force)
