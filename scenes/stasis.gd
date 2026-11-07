extends Node2D

@export var scene = ""

signal mysignal

func _ready() -> void:
	mysignal.emit(scene)
