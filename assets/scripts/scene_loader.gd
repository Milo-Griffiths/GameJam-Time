extends Node2D
var level1 = preload("res://scenes/levels/Level1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func loadscene1():
	get_tree().change_scene_to_packed(level1)


func _on_play_button_down() -> void:
	loadscene1()


func _on_exit_pressed() -> void:
	get_tree().quit()
