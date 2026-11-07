extends Node2D
var level3 = preload("res://scenes/levels/Level3.tscn")
var death = preload("res://scenes/Death/Death.tscn")
var objective_done = false

func loadnextlevel():
	get_tree().change_scene_to_packed(level3)

func loaddeath():
	get_tree().change_scene_to_packed(death)

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
