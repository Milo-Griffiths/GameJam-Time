class_name  interact
extends Area2D

var interacted = false


func _on_player_interact() -> void:
	interacted = true
	
func _process(delta: float) -> void:
	if interacted:
		print("interacted")
