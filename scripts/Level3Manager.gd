extends Node2D
var level3 = preload("res://scenes/levels/Level3.tscn")
var death = preload("res://scenes/Death/Death.tscn")
var objective_complete = false
var objectivesdone = 0	
@export
var total_objectives : int
var Objectivemessage : String = "Collect "

#func loadnextlevel():
	#get_tree().change_scene_to_packed(level3)

func loadnextlevel() -> void:
	FadeTransition.change_to(level3)

func loaddeath():
	get_tree().change_scene_to_packed(death)

func _ready() -> void:
	$"../player/Camera2D/Player_UI/objective_ui/CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText".text = Objectivemessage + " (" + str(objectivesdone) + "/"+ str(total_objectives) + ")"
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func interactedwith() -> void:
	objectivesdone += 1
	$"../player/Camera2D/Player_UI/objective_ui/CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText".text = Objectivemessage + " (" + str(objectivesdone) + "/"+ str(total_objectives) + ")"
	if objectivesdone >= total_objectives:
		objective_complete = true
		



func _on_stasis_scene_switch() -> void:
	if objectivesdone >= total_objectives:
		loadnextlevel()
