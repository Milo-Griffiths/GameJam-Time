extends Control


# Initially there are no objectives
func _ready() -> void:
	$CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText.text = ""
	$CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText2.text = ""
	$CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText3.text = ""
	$CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/ObjectiveText4.text = ""
