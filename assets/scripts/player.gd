extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var moving = false

#interaction stuff
var Interact_prompt = load("res://scenes/UI/interaction_ui.tscn")
var prompt  = null
var Interactive_range = false
signal Interact

func _physics_process(delta: float) -> void:
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
	if velocity.x > 1 or velocity.x < -1:
			animated_sprite_2d.animation = "awful"
	else:
			animated_sprite_2d.animation = "awful_idle"
	if direction:
		velocity.x = direction * SPEED
		moving = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
	if direction == 1.0:
		animated_sprite_2d.flip_h = false
	elif direction == -1.0:
		animated_sprite_2d.flip_h = true

func _on_interactable_body_entered():
	Interactive_range = true
	prompt = Interact_prompt.Instantiate()
	
func _on_interactable_body_exited():
	Interactive_range = false
	prompt.queue_free()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		emit_signal("Interact")
