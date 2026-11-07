extends RigidBody2D

@export var speed = 100

var dir : float
var spawnpos : Vector2
var spawnRot : float
var velocity : Vector2
var cast : ShapeCast2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = spawnpos
	global_rotation = spawnRot
	set_contact_monitor(true)
	set_max_contacts_reported(5)
	cast = $ShapeCast2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	velocity = Vector2(speed,0).rotated(dir)
	if cast.is_colliding():
		queue_free()
	move_and_collide(velocity)
