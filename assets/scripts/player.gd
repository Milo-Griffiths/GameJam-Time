extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export
var SPEED = 300.0
@export
var JUMP_VELOCITY = -400.0

var moving = false
var Interactive_range = false
var Interacted = null
var push_speed = 600



@export var ACCEL_GROUND: float = 2000.0
@export var ACCEL_AIR: float = 500.0


func _physics_process(delta: float) -> void:
	
	var dir_to_mouse: Vector2 = (get_global_mouse_position() - global_position).normalized()
	var opposite_dir: Vector2 = -dir_to_mouse
	moving = false
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		moving = true;
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	var accel := ACCEL_GROUND if is_on_floor() else ACCEL_AIR
	if velocity.x > 1 or velocity.x < -1:
			animated_sprite_2d.animation = "awful"
	else:
			animated_sprite_2d.animation = "awful_idle"
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, accel * delta)
		moving = true
	else:
		velocity.x = move_toward(velocity.x, direction * SPEED, accel * delta)
	if not is_on_floor() and Input.is_action_just_pressed("shoot"):
		var away := (global_position - get_global_mouse_position()).normalized()
		velocity += away * push_speed
	
	move_and_slide()
	
	
	if direction == 1.0:
		animated_sprite_2d.flip_h = false
	elif direction == -1.0:
		animated_sprite_2d.flip_h = true

func _on_interactable_body_entered(body: Node2D) -> void:
	pass
	
