extends StaticBody2D


var bulletdetection : ShapeCast2D
signal killed
var sprite : AnimatedSprite2D
var playerdetect : CollisionShape2D

@export
var path = "Level1"
@export
var jumpspeed : float
@export
var hp : int = 50
func _ready() -> void:
	bulletdetection = $ShapeCast2D
	sprite = $AnimatedSprite2D

func _process(_delta: float) -> void:
	if bulletdetection.is_colliding():
		hp = hp -1
		if hp <= 0:
			killed.emit()
			sprite.play("Death")
			set_physics_process(false)
			set_process(false)
			await sprite.animation_finished
			queue_free()
		else:
			flash_red()

func flash_red() -> void:
	var tween := create_tween()
	sprite.modulate = Color(1, 0.2, 0.2)
	tween.tween_property(sprite, "modulate", Color.WHITE, 0.15)





	
	

	

	
