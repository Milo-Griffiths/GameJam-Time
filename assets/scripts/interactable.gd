class_name  interact
extends StaticBody2D
var interactable = false
signal interactingdist
signal non_interact
const interactionDist = 320


func _process(delta: float) -> void:
	var player: CharacterBody2D = get_tree().get_root().get_node("Level1").get_node("player")
	var deltaD  = (Vector2)($".".position - player.position)
	var Distance = sqrt((deltaD.x * deltaD.x) + (deltaD.y * deltaD.y))
	if Distance < interactionDist:
		emit_signal("interactingdist")
		interactable = true
	else:
		emit_signal("non_interact")
		interactable = false 
		
		
		
		
		
		
		
		
		
		
		
		
	
func _input(event):
	if event.is_action_pressed("Interact") and interactable:
		print("hdsfdbjkasnd")
	
	
