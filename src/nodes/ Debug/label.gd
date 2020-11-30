extends Node2D

export (NodePath) var watch_object
export (String) var member
onready var Watched: Node = get_node(watch_object)
onready var label: Label = $Label

func _process(_delta):
    label.text = member + ": " + var2str(Watched.get(member))
