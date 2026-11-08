extends Node2D
var enemieskilled : int = 0
var level2 = preload("res://scenes/levels/Level2.tscn")
var death = preload("res://scenes/Death/Death.tscn")
var objective_done = false
var Objectivemessage : String = "Kill the rats"
@export
var total_objectives : int
signal objectivesdone
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../player/Camera2D/Player_UI/objective_ui/CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText".text = Objectivemessage + " (" + str(enemieskilled) + "/"+ str(total_objectives) + ")"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

#func loadnextlevel():
	#get_tree().change_scene_to_packed(level2)

func loadnextlevel() -> void:
	FadeTransition.change_to(level2)

func loaddeath():
	FadeTransition.change_to(death)

func enemykilled():
	enemieskilled += 1
	$"../player/Camera2D/Player_UI/objective_ui/CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText".text = Objectivemessage + " (" + str(enemieskilled) + "/"+ str(total_objectives) + ")"
	if enemieskilled == total_objectives:
		objective_done = true
		objectivesdone.emit()




func _on_stasis_scene_switch() -> void:
	if objective_done:
		loadnextlevel()
