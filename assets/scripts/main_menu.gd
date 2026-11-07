extends Control

func _on_play_pressed() -> void:
	## Go to main
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_settings_pressed() -> void:
	# Go to settings 
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	get_tree().quit()
