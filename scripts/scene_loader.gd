extends Node2D
var level1 = preload("res://scenes/levels/Level1.tscn").instantiate
var level2 = preload("res://scenes/levels/Level2.tscn").instantiate

var mainmenu = preload("res://scenes/main_menu.tscn").instantiate




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("/root/main").free()
	get_tree().root.add_child(mainmenu)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func loadscene1():
	get_tree().root.add_child(level1)

func loadscene2():
	get_tree().root.add_child(level2)