extends CharacterBody2D

@export
var SPEED = 300.0
@export
var JUMP_VELOCITY = -400.0
@export
var startbackwards : bool
var dir = 1	

var ray : RayCast2D
var sprite : AnimatedSprite2D

func _ready() -> void:
	ray = $WallDetection
	sprite = $AnimatedSprite2D
	sprite.play("walk")
	if startbackwards:
		flip()
	
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if ray.is_colliding():
		flip()

	if dir:
		velocity.x = dir * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
func flip():
	dir = dir *-1
	ray.scale.x = ray.scale.x * -1
	if dir == -1:
		sprite.flip_h = true
	else:
		sprite.flip_h = false