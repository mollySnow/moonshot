extends WeaponSystem

onready var bullet_spawn_point: Position2D = $Node2D/BulletSpawnPoint
onready var gun_sprite: Sprite = $Node2D/GunSprite
onready var rotate_node: Node2D = $Node2D

var cooldown_start: float = 2.0
var cooldown = 0

func _process(delta):
	cooldown -= delta

func aim(v: Vector2) -> void:
	rotate_node.rotation = v.angle()

func shoot() -> Vector2:
	if cooldown > 0: return Vector2.ZERO
	cooldown = cooldown_start

	var boom = 1200
	var velocity = (bullet_spawn_point.global_position - global_position).normalized() * boom
	Signals.gun_shot_emit(velocity, bullet_spawn_point.global_position, 1)
	return -(bullet_spawn_point.global_position - global_position) * 2
