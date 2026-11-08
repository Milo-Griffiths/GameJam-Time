extends Control


func _ready() -> void:
	# Make the entire UI invisible immediately when the scene is loaded
	modulate.a = 0.0 
	
	# Tween to handle the animation
	var tween = create_tween()
	
	# Animate the alpha ("modulate:a") to 1.0 (fully visible) over 1.5 seconds
	# Can adjust 1.5 value
	tween.tween_property(self, "modulate:a", 1.0, 1.5)
	


func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
