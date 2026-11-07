class_name InteractionUI
extends Control

@onready var interaction_prompt: PanelContainer = $CanvasLayer/InteractionPrompt
@onready var prompt_text: Label = $CanvasLayer/InteractionPrompt/MarginContainer/VBoxContainer/PromptText

var popup_base_y := 0.0
var float_time := 0.0

func _ready() -> void:
	add_to_group("interaction_ui")
	prompt_text.text = "Press E"
	interaction_prompt.hide()
	popup_base_y = interaction_prompt.position.y

func _process(delta: float) -> void:
	if interaction_prompt.visible:
		float_time += delta
		var bob: float = roundf(sin(float_time * 6.0) * 3.0)
		interaction_prompt.position.y = popup_base_y + bob

func show_prompt() -> void:
	interaction_prompt.show()

func hide_prompt() -> void:
	interaction_prompt.hide()
