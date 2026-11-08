extends Node2D
var enemieskilled : int = 0
var level2 = preload("res://scenes/levels/Level2.tscn")
var death = preload("res://scenes/Death/Death.tscn")
var objective_done = false
var Objectivemessage1 : String = "Kill the rats"
var Objectivemessage2 : String = "Plant Flower"
var flowerplanted : bool = false

@export
var total_objectives : int
signal objectivesdone
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../player/Camera2D/Player_UI/objective_ui/CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText".text = Objectivemessage1 + " (" + str(enemieskilled) + "/"+ str(total_objectives) + ")"

	$"../player/Camera2D/Player_UI/objective_ui/CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText2".text = Objectivemessage2 + " (" + str(0) + "/"+ str(1) + ")"
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
	$"../player/Camera2D/Player_UI/objective_ui/CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText".text = Objectivemessage1 + " (" + str(enemieskilled) + "/"+ str(total_objectives) + ")"
	if enemieskilled == total_objectives and flowerplanted:
		objective_done = true
		objectivesdone.emit()




func _on_stasis_scene_switch() -> void:
	if objective_done:
		loadnextlevel()


func plant_flower() -> void:
	flowerplanted = true
	$"../player/Camera2D/Player_UI/objective_ui/CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText2".text = Objectivemessage2 + " (" + str(1) + "/"+ str(1) + ")"
