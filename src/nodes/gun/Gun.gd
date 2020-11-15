extends Node2D

onready var bullet_spawn_point: Position2D = $Node2D/BulletSpawnPoint
onready var gun_sprite: Sprite = $Node2D/GunSprite
onready var rotate_node: Node2D = $Node2D

func _process(_delta):
	rotate_node.rotation = get_local_mouse_position().angle()

func shoot(bullet_system: BulletSystem) -> Vector2:
	var boom = 400
	var velocity = (bullet_spawn_point.global_position - global_position).normalized() * boom
	bullet_system.new_bullet("normal", velocity, bullet_spawn_point)
	return -(bullet_spawn_point.global_position - global_position) * 2
