extends Control

signal hit
# Called when the node enters the scene tree for the first time.


func _on_player_hurt() -> void:
	emit_signal("hit")
