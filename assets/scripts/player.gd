extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hit_box : Area2D = $HitBox
@export
var SPEED = 300.0
@export
var JUMP_VELOCITY = -400.0
@export
var hp : int = 10000

var moving = false
var canjump = true
signal died

#interaction stuff
#var Interact_prompt = load("res://scenes/UI/interaction_ui.tscn")
#var prompt  = null
#@onready var interaction_ui: InteractionUI = get_tree().get_first_node_in_group("interaction_ui") as InteractionUI
var Interactive_range = false
var Interacted = null
@export
var push_speed = 900
var iframes = 0


@export var ACCEL_GROUND: float = 2000.0
@export var ACCEL_AIR: float = 500.0
func _process(delta: float) -> void:
	if hit_box.has_overlapping_bodies() and iframes <= 0:
		print("damage")
		hp = hp -10
		iframes = 5
	if iframes > 0:
		iframes = iframes - delta * 10
	if hp <= 0:
		died.emit()


func _physics_process(delta: float) -> void:	
	var air = false
	var dir_to_mouse: Vector2 = (get_global_mouse_position() - global_position).normalized()
	var opposite_dir: Vector2 = -dir_to_mouse
	moving = false
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite_2d.animation = "air"
		air = true
	else:
		canjump = true
		

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		moving = true;
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	var accel := ACCEL_GROUND if is_on_floor() else ACCEL_AIR
	if (velocity.x > 1 or velocity.x < -1) and not air:
			animated_sprite_2d.animation = "awful"
	elif not air:
			animated_sprite_2d.animation = "awful_idle"
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, accel * delta)
		#allow instant stopping / change direction
		if direction == 1 and velocity.x < 0:
			velocity.x = 0
		if direction == -1 and velocity.x > 0:
			velocity.x = 0
		moving = true
	else:
		velocity.x = move_toward(velocity.x, direction * SPEED, accel * delta)
	
	move_and_slide()
	
	
	if direction == 1.0:
		animated_sprite_2d.flip_h = false
	elif direction == -1.0:
		animated_sprite_2d.flip_h = true


func _on_static_body_2d_interactingdist() -> void:
	var ui: InteractionUI = get_tree().get_first_node_in_group("interaction_ui") as InteractionUI

	if ui != null:
		ui.show_prompt()

func _on_static_body_2d_non_interact() -> void:
	var ui: InteractionUI = get_tree().get_first_node_in_group("interaction_ui") as InteractionUI

	if ui != null:
		ui.hide_prompt()


func _on_gun_shot() -> void:
	var opposite_dir: Vector2 = -((get_global_mouse_position() - global_position).normalized())
	if not is_on_floor() and  canjump:
		velocity += opposite_dir * push_speed
		canjump = false
	
