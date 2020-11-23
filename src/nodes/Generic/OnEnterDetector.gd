extends Area2D

export (NodePath) var node_path
export (String) var on_body_enter = "on_body_entered"
export (String) var on_body_exited = "on_body_exited"
export (int) var radius
onready var node: Node = get_node(node_path)
onready var shape = $Shape

func _ready():
	print("shit")
	var circle = CircleShape2D.new()
	circle.radius = radius
	shape.shape = circle
	print(shape.shape.radius)
	var _ce = connect("body_entered", node, on_body_enter) 
	var _cx = connect("body_exited", node, on_body_exited) 