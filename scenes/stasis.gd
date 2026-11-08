extends Node2D
var objectives

signal sceneSwitch

func _ready() -> void:
	pass

func _process(delta) -> void:
	objectives = get_tree().get_nodes_in_group("Objectivenodes")
	if objectives.size() == 0:
		add_to_group("Objectivenodes")


func _on_collision_shape_2d_sigout() -> void:
	sceneSwitch.emit()
