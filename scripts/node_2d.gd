extends Node2D

@onready var main = get_tree().get_root().get_child(1)
@onready var projectile = load("res://scenes/bullet.tscn")

@onready var shoot_sound = $ShootSound

signal shot
var attackcooldown = 0

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("shoot") and attackcooldown <= 0:
		shoot()
		shot.emit()
		attackcooldown = 10
	if attackcooldown > 0:
		attackcooldown = attackcooldown - 25 * delta

func shoot():
	var sprite : AnimatedSprite2D = $AnimatedSprite2D
	sprite.play("new_animation")
	
	shoot_sound.play()
	
	var point : Node2D = get_node("Node2D")
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnpos = point.global_position
	instance.spawnRot = rotation
	main.add_child.call_deferred(instance)
