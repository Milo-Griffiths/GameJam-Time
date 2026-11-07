extends CharacterBody2D

@export
var SPEED = 300.0
@export
var JUMP_VELOCITY = -400.0
@export
var startbackwards : bool
@export
var target_distance : float

var dir = 1	

var wallray : RayCast2D
var playerray : RayCast2D
var sprite : AnimatedSprite2D

func _ready() -> void:
	wallray = $WallDetection
	playerray = $Playerdetection
	sprite = $AnimatedSprite2D
	if startbackwards:
		flip()
	
func _process(_delta: float) -> void:
	if playerray.is_colliding():
		print("ow")

func _physics_process(delta: float) -> void:
	#target player
	var player: CharacterBody2D = get_tree().get_root().get_node("Level1").get_node("player")
	var target : float = (player.position- position).normalized().x

	var distance = player.position.distance_to(position)
	if distance < target_distance:
		if target > 0 and dir == -1:
			flip()
		elif target < 0 and dir == 1:
			flip()

	if not is_on_floor():
		velocity += get_gravity() * delta

	if wallray.is_colliding():
		flip()

	if dir:
		velocity.x = dir * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()



func flip():
	dir = dir *-1
	wallray.scale.x = wallray.scale.x * -1
	if dir == -1:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
