extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var menu = preload("res://scenes/main_menu.tscn")
	get_tree().remove_(menu)


