extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var dir = 1	
var ray : RayCast2D
var sprite : AnimatedSprite2D
func _ready() -> void:
	ray = $RayCast2D
	sprite = $AnimatedSprite2D



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if ray.is_colliding():
		dir = dir *-1
		ray.scale.x = ray.scale.x * -1
		if dir == -1:
			sprite.flip_h = true
		else:
			sprite.flip_h = false

	var direction = dir
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
