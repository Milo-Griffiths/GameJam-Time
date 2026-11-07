extends CollisionShape2D
var level1 = preload("res://scenes/levels/Level1.tscn")
var inside = false
var scene = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inside == true && Input.is_action_just_pressed("up"):
		loadscene()

func loadscene():
	get_tree().change_scene_to_file(scene)


func _on_area_2d_body_exited(body: CharacterBody2D) -> void:
	inside = false

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	inside = true


func _on_stasis_mysignal(sc: String) -> void:
	scene = "res://scenes/levels/"+sc+".tscn"
