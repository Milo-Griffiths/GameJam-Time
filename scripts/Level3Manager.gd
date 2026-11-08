extends Node2D
var death = preload("res://scenes/Death/Death.tscn")
var gameEnd = preload("res://scenes/GameEnd/GameEnd.tscn")
var objective_complete = false
var objectivesdone = 0	
@export
var total_objectives : int
var Objectivemessage : String = "Collect "
var test : bool = true 

func loaddeath():
	get_tree().change_scene_to_packed(death)

func _ready() -> void:
	$"../player/Camera2D/Player_UI/objective_ui/CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText".text = Objectivemessage + " (" + str(objectivesdone) + "/"+ str(total_objectives) + ")"
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


#func interactedwith() -> void:
	#objectivesdone += 1
	#$"../player/Camera2D/Player_UI/objective_ui/CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText".text = Objectivemessage + " (" + str(objectivesdone) + "/"+ str(total_objectives) + ")"
	#if objectivesdone >= total_objectives:
		#objective_complete = true
		#

func loadGameEnd() -> void:
	get_tree().change_scene_to_packed(gameEnd)

func _on_stasis_scene_switch() -> void:
	if objectivesdone >= total_objectives:
		loadGameEnd()

# Test function to skip level (Press T)
func _unhandled_input(event: InputEvent) -> void:
	if test and event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_T:
			loadGameEnd()
