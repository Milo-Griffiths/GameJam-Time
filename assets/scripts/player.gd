extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hit_box : Area2D = $HitBox
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var walk_sound: AudioStreamPlayer2D = $WalkSound

@export
var SPEED = 300.0
@export
var JUMP_VELOCITY = -400.0
@export
var hp : int = 10000

var moving = false
var canjump = 2
signal died

var Interactive_range = false
var Interacted = null
@export
var push_speed = 900
var iframes = 0
var is_hurt = false
var light_default_colour
@export var ACCEL_GROUND: float = 2000.0
@export var ACCEL_AIR: float = 500.0
@onready var point_light: PointLight2D = $PointLight2D

func _ready() -> void:
	animated_sprite_2d.animation_finished.connect(_on_animation_finished)
	light_default_colour = point_light.color

func _on_animation_finished() -> void:
	if animated_sprite_2d.animation == "damage":
		point_light.color = light_default_colour
		is_hurt = false
		animated_sprite_2d.play()
		

func _physics_process(delta: float) -> void:	
	var air = false
	
	moving = false
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
		# 2. Stop walking sound if we fall or jump into the air
		walk_sound.stop() 
		
		if not is_hurt:
			animated_sprite_2d.animation = "air"
		air = true
	else:
		canjump = 2
		

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		moving = true
		
		jump_sound.play() 

	var direction := Input.get_axis("left", "right")
	var accel := ACCEL_GROUND if is_on_floor() else ACCEL_AIR
	
	if (velocity.x > 1 or velocity.x < -1) and not air and not is_hurt:
			animated_sprite_2d.animation = "awful"
			
		
			if not walk_sound.playing:
				walk_sound.play()
				
	elif not air and not is_hurt:
			animated_sprite_2d.animation = "awful_idle"
			
			
			walk_sound.stop()
			
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, accel * delta)
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

func _process(delta: float) -> void:
	if hit_box.has_overlapping_bodies() and iframes <= 0:
		print("damage")
		animated_sprite_2d.play("damage")
		is_hurt = true
		point_light.color = Color.RED
		hp = hp -10
		iframes = 5
	if iframes > 0:
		iframes = iframes - delta * 10
	if hp <= 0:
		died.emit()


func _on_gun_shot() -> void:
	var opposite_dir: Vector2 = -((get_global_mouse_position() - global_position).normalized())
	if not is_on_floor() and canjump:
		velocity += opposite_dir * push_speed
		canjump = canjump -1
