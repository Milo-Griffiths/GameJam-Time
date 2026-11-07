extends ProgressBar

var Initial_Time = 900
var time = 900

func _ready() -> void:
	time = Initial_Time


# Called every frame. 'delta' is the
func _process(delta: float) -> void:
	time -= delta
	if (time > Initial_Time):
		time = Initial_Time
	elif (time <= 0):
		pass
	$".".value = (time/Initial_Time)* 100;
