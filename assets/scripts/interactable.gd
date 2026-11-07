class_name  interact
extends Area2D
var interactable = false
signal interactingdist
signal non_interact
const interactionDist = 32
var player: CharacterBody2D =  $"..".get_node("player")

func _process(delta: float) -> void:
	var deltaD  = (Vector2)($".".transform.position - player.Position)
	var Distance = (deltaD.x * deltaD.x) + (deltaD.y * deltaD.y)
	if Distance < interactionDist:
		emit_signal("interactingdist")
		interactable = true
	else:
		emit_signal("non_interact")
		interactable = false 
		
func _input(event):
	if event.is_action_pressed("Interact") and interactable:
		print("hdsfdbjkasnd")
	
	
