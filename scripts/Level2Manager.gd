extends Node2D
var level3 = preload("res://scenes/levels/Level3.tscn")
var death = preload("res://scenes/Death/Death.tscn")
var objective_complete = false
var objectivesdone = 0	
@export
var total_objectives : int
var Objectivemessage : String = "Collect Flowers + get sprite"
var test : bool = true 

#func loadnextlevel():
	#get_tree().change_scene_to_packed(level3)

func loadnextlevel() -> void:
	FadeTransition.change_to(level3, "40 years later...")

func loaddeath():
	get_tree().change_scene_to_packed(death)

func _ready() -> void:
	$"../player/Camera2D/Player_UI/objective_ui/CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText".text = Objectivemessage + " (" + str(objectivesdone) + "/"+ str(total_objectives) + ")"
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("cheat"):
		objectivesdone = 50
	$"../player/Camera2D/Player_UI/objective_ui/CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText".text = Objectivemessage + " (" + str(objectivesdone) + "/"+ str(total_objectives) + ")"


func interactedwith() -> void:
	objectivesdone = objective_complete +1
	$"../player/Camera2D/Player_UI/objective_ui/CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText".text = Objectivemessage + " (" + str(objectivesdone) + "/"+ str(total_objectives) + ")"
	if objectivesdone >= total_objectives:
		objective_complete = true
		

func _on_stasis_scene_switch() -> void:
	if objectivesdone >= total_objectives:
		loadnextlevel()

# Test function to skip level (Press T)
func _unhandled_input(event: InputEvent) -> void:
	if test and event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_T:
			loadnextlevel()


func flower_picked() -> void:
	pass # Replace with function body.
