extends Node2D

func _ready():
	$"../GameOver".visible=false
	pass
	
func _process(delta):
	if get_node("../HealthBar").hp==0:
		$"../GameOver".visible=true
	
