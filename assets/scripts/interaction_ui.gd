extends Control

@onready var interaction_prompt: PanelContainer = $CanvasLayer/InteractionPrompt
@onready var prompt_text: Label = $CanvasLayer/InteractionPrompt/MarginContainer/VBoxContainer/PromptText
@onready var key_label: Label = $CanvasLayer/InteractionPrompt/MarginContainer/VBoxContainer/Key
var popup_base_y := 0.0
var float_time := 0.0

# USE 
#extends Area2D
#
#@export var prompt_message := “Pick up battery” (change here)
#@export var prompt_key := "E" (change here) 
#
#var player_nearby := false
#var hud
##func _ready() -> void:
	#hud = get_tree().get_first_node_in_group("hud")
#
#func _on_body_entered(body: Node2D) -> void:
	#if body.is_in_group("player"):
		#player_nearby = true
		#hud.show_interaction_prompt(prompt_message, prompt_key)
#
#func _on_body_exited(body: Node2D) -> void:
	#if body.is_in_group("player"):
		#player_nearby = false
		#hud.hide_interaction_prompt()
#
#func _process(_delta: float) -> void:
	#if player_nearby and Input.is_action_just_pressed("interact"):
		#interact()
#
#func interact() -> void:
	#print("Interacted with object")
# TO CREATE THE BOX

func _ready() -> void:
	add_to_group("hud")
	interaction_prompt.hide()
	#show_interaction_prompt("Pick up battery","E") - For testing
	popup_base_y = interaction_prompt.position.y
	
func _process(delta: float) -> void:
	if interaction_prompt.visible:
		float_time += delta
		var bob: float = roundf(sin(float_time * 6.0) * 3.0)
		interaction_prompt.position.y = popup_base_y + bob

func show_interaction_prompt(message: String, key: String) -> void:
	key_label.text = key
	prompt_text.text = message
	interaction_prompt.show()

func hide_interaction_prompt() -> void:
	interaction_prompt.hide()
