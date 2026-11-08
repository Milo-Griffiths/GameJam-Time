extends Label

var Initial_Time = 900
var time = 900
var timepasses : bool

func _ready() -> void:
	time = Initial_Time


# Called every frame. 'delta' is the
func _process(delta: float) -> void:
	time -= delta
	if (time > Initial_Time):
		time = Initial_Time
	elif (time <= 0):
		get_tree().change_scene_to_file("res://scenes/Death/Death.tscn")
	var mins : int = time / 60
	var sec : int = int(time) % 60
	text = str(mins) +":"+ str(sec)
