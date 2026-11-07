extends Node2D


signal sceneSwitch

func _ready() -> void:
	pass



func _on_collision_shape_2d_sigout() -> void:
	sceneSwitch.emit()
