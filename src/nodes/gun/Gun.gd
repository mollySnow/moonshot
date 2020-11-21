extends Node2D

onready var bullet_spawn_point: Position2D = $Node2D/BulletSpawnPoint
onready var gun_sprite: Sprite = $Node2D/GunSprite
onready var rotate_node: Node2D = $Node2D

func aim(v: Vector2) -> void:
	rotate_node.rotation = v.angle()

func shoot() -> Vector2:
	var boom = 1200
	var velocity = (bullet_spawn_point.global_position - global_position).normalized() * boom
	Signals.gun_shot_emit(velocity, bullet_spawn_point.global_position, 1)
	return -(bullet_spawn_point.global_position - global_position) * 2
