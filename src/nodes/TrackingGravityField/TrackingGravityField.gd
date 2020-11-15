extends Node2D

export (NodePath) var orbiting_path

onready var orbiting_position: Node2D = get_node(orbiting_path)
onready var field: Area2D = $GravityField

func _process(_delta):
	field.rotation = (global_position - orbiting_position.global_position).angle()
