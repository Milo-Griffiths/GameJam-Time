extends PanelContainer
##IF YOU WANT TO ADD AN OBJECTIVE, USE THESE FUNCTIONS: 
##FOR OBJECTIVE 1: 
##$ObjectiveTracker/PanelContainer.set_objective("Collect 3 batteries")
##FOR OBJECTIVE 2: 
##$ObjectiveTracker/PanelContainer.set_objective2("Find the cure")
##AND SO ON 

@onready var objective_text: Label = $MarginContainer/VBoxContainer/ObjectiveText
@onready var objective_text2: Label = $MarginContainer/VBoxContainer/ObjectiveText2
@onready var objective_text3: Label = $MarginContainer/VBoxContainer/ObjectiveText3
@onready var objective_text4: Label = $MarginContainer/VBoxContainer/ObjectiveText4


func set_objective(new_objective: String) -> void:
	objective_text.text = new_objective

func set_objective2(new_objective2: String) -> void:
	objective_text2.text = new_objective2

func set_objective3(new_objective3: String) -> void:
	objective_text3.text = new_objective3
	
func set_objective4(new_objective4: String) -> void:
	objective_text4.text = new_objective4
