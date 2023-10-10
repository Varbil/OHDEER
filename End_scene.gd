extends Node2D
	

func _ready():
	$"../CanvasLayer/ui/Gameover".visible=false

	pass
	
func _process(delta):
	if $"../CanvasLayer/ui".hp<=0:
		$"../CanvasLayer/ui/Gameover".visible=true
		
	delta=delta


