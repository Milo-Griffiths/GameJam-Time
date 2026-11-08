extends CollisionShape2D
var inside = false
var scene = ""
signal sigout

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if inside == true && Input.is_action_just_pressed("up"):
		loadscene()

func loadscene():
	sigout.emit()
	#get_tree().change_scene_to_file(scene)


func _on_area_2d_body_exited(_body: CharacterBody2D) -> void:
	inside = false

func _on_area_2d_body_entered(_body: CharacterBody2D) -> void:
	inside = true


