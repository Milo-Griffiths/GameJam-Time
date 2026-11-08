extends CharacterBody2D

@export
var SPEED = 300.0
@export
var JUMP_VELOCITY = -400.0
@export
var startbackwards : bool
@export
var target_distance : float
@export
var path = "Level1"
@export
var jumpspeed : float
@export
var hp : int = 3
var dir = 1	

signal killed


var wallray : RayCast2D
var playerray : RayCast2D
var sprite : AnimatedSprite2D
var manager : Node2D
var bulletdetection : ShapeCast2D
var jumping : bool = false

func _ready() -> void:
	wallray = $WallDetection
	playerray = $Playerdetection
	sprite = $AnimatedSprite2D
	bulletdetection = $ShapeCast2D
	if startbackwards:
		flip()
	
func _process(_delta: float) -> void:
	if bulletdetection.is_colliding():
		hp = hp -1
		if hp == 0:
			killed.emit()
			sprite.play("Death")
			set_physics_process(false)
			set_process(false)
			await sprite.animation_finished
			queue_free()


func _physics_process(delta: float) -> void:
	#target player
	var player: CharacterBody2D = get_tree().get_root().get_node(path).get_node("player")
	var target : float = (player.position- position).normalized().x

	var distance = player.position.distance_to(position)
	if distance < target_distance and is_on_floor():
		if target > 0 and dir == -1:
			flip()
		elif target < 0 and dir == 1:
			flip()
		velocity.y = JUMP_VELOCITY
	

	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if wallray.is_colliding():
		flip()

	if dir:
		velocity.x = dir * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if !is_on_floor():
		velocity.x = velocity.x * 3
	
	move_and_slide()


	




func flip():
	dir = dir *-1
	wallray.scale.x = wallray.scale.x * -1
	if dir == -1:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
func tell():
	pass
