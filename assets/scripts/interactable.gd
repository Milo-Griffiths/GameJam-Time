class_name  interact
extends StaticBody2D
var interactable = false
signal interactingdist
signal non_interact
const interactionDist = 100


func _process(_delta: float) -> void:
	var player: CharacterBody2D = get_tree().get_root().get_node("Level2").get_node("player")
	var distance: float = global_position.distance_to(player.global_position)
	var now_interactable: bool = distance < interactionDist

	if now_interactable == interactable:
		return

	interactable = now_interactable

	if interactable:
		interactingdist.emit()
	else:
		non_interact.emit()
	
func _input(event):
	if event.is_action_pressed("Interact") and interactable:
		print("hdsfdbjkasnd")
	
	
