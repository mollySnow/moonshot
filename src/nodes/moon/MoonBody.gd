extends RigidBody2D

export (NodePath) var bullet_system_path
onready var bullet_system: BulletSystem = get_node(bullet_system_path)
onready var gun_root = $GunRoot

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		apply_impulse(Vector2.ZERO, gun_root.shoot(bullet_system))
		
