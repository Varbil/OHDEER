extends Node2D
	

func _ready():
	

	pass
	
func _process(delta):
	if $"../CanvasLayer/ui".hp<=0:
		get_tree().change_scene("Game_over.tscn")
		
	delta=delta


