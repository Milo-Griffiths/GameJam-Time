extends RigidBody2D

@export var speed = 100

var dir : float
var spawnpos : Vector2
var spawnRot : float
var velocity : Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = spawnpos
	global_rotation = spawnRot


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	velocity = Vector2(speed,0).rotated(dir)
	move_and_collide(velocity)
