extends Node2D

var dir = -1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	var tween = create_tween()
	while true:
		tween.tween_property($".","position",Vector2(0,0),0.02)
		tween.tween_property($".","position",Vector2(0,50),0.02)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	