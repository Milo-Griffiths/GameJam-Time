extends Node2D

@export var scene = ""

signal mysignal
signal sceneSwitch

func _ready() -> void:
	mysignal.emit(scene)



func _on_collision_shape_2d_sigout() -> void:
	sceneSwitch.emit()
