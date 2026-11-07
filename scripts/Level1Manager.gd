extends Node2D
var enemieskilled : int = 0
var level2 = preload("res://scenes/levels/Level2.tscn")
var death = preload("res://scenes/Death/Death.tscn")
var objective_done = false
signal objectivesdone
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../player/Camera2D/Player_UI/objective_ui/CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText".text = "Kill the rats (0/2)"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func loadnextlevel():
	get_tree().change_scene_to_packed(level2)

func loaddeath():
	get_tree().change_scene_to_packed(death)

func enemykilled():
	enemieskilled += 1
	$"../player/Camera2D/Player_UI/objective_ui/CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText".text = "Kill the rats (1/2)"  
	if enemieskilled == 2:
		$"../player/Camera2D/Player_UI/objective_ui/CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText".text = "Kill the rats (2/2)"  
		objective_done = true
		objectivesdone.emit()




func _on_stasis_scene_switch() -> void:
	if objective_done:
		loadnextlevel()
