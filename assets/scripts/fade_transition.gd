extends CanvasLayer

@onready var overlay: ColorRect = $ColorRect
@onready var transition_text: Label = $TransitionText

@export var fade_duration := 1.2

var transitioning := false

func _ready() -> void:
	overlay.size = get_viewport().get_visible_rect().size
	overlay.hide()
	transition_text.hide()

func change_to(next_scene: PackedScene, message: String = "Loading…") -> void:
	if transitioning:
		return

	transitioning = true
	overlay.show()
	transition_text.show()

	overlay.modulate.a = 0.0
	transition_text.modulate.a = 0.0
	transition_text.text = message

	var tween := create_tween().set_parallel(true)
	tween.tween_property(overlay, "modulate:a", 1.0, fade_duration)
	tween.tween_property(transition_text, "modulate:a", 1.0, fade_duration)
	await tween.finished

	get_tree().change_scene_to_packed(next_scene)
	await get_tree().process_frame

	tween = create_tween().set_parallel(true)
	tween.tween_property(overlay, "modulate:a", 0.0, fade_duration)
	tween.tween_property(transition_text, "modulate:a", 0.0, fade_duration)
	await tween.finished

	overlay.hide()
	transition_text.hide()
	transitioning = false
