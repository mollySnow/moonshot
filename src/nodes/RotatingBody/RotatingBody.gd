extends Node2D

export (int) var speed = 100

func _process(delta):
	rotate(speed * delta)