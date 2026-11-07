extends Node2D
var level1 = preload("res://scenes/levels/Level1.tscn").instantiate

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func loadscene1():
	get_tree().root.add_child(level1)
	