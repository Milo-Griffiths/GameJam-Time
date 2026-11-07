extends Node2D
var level3 = preload("res://scenes/levels/Level3.tscn")
var death = preload("res://scenes/Death/Death.tscn")
var objective_complete = false
var objectivesdone = 0	
@export
var total_objectives : int


func loadnextlevel():
	get_tree().change_scene_to_packed(level3)

func loaddeath():
	get_tree().change_scene_to_packed(death)

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func interactedwith() -> void:
	objectivesdone += 1



func _on_stasis_scene_switch() -> void:
	if objectivesdone >= total_objectives:
		loadnextlevel()
