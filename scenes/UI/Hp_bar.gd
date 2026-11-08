extends ProgressBar

const maxhp = 100
var health =100

func _ready():
	health = maxhp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$".".value = (float(health)/float(maxhp))*100 

func damadge(dmg):
	health -= dmg
func regen(boost):
	health += boost
	if(health > maxhp):
		health = maxhp


func _on_player_ui_hit() -> void:
	damadge(10)
