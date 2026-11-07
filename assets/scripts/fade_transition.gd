extends CanvasLayer

@onready var overlay: ColorRect = $ColorRect

var transitioning := false

func _ready() -> void:
	overlay.size = get_viewport().get_visible_rect().size
	overlay.hide()

func change_to(next_scene: PackedScene) -> void:
	if transitioning:
		return

	transitioning = true
	overlay.show()
	overlay.modulate.a = 0.0

	var tween := create_tween()
	tween.tween_property(overlay, "modulate:a", 1.0, 0.4)
	await tween.finished

	get_tree().change_scene_to_packed(next_scene)
	await get_tree().process_frame

	tween = create_tween()
	tween.tween_property(overlay, "modulate:a", 0.0, 0.4)
	await tween.finished

	overlay.hide()
	transitioning = false
