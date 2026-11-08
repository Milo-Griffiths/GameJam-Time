extends Sprite2D
var objectives
var closest : Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	objectives = get_tree().get_nodes_in_group("Objectivenodes")
	closest = objectives[0].global_position
	for i in range(1,objectives.size()):
		var current = objectives[i].global_position
		var center = get_parent().global_position
		
		if (current.distance_to(center)) < (closest.distance_to(center)):
			closest = current

	
	look_at(closest)
	
