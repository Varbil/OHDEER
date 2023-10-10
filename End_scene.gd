extends Node2D
	
var max_hp:=6
var hp :=6 
var cframe:=0 #curret frame


func _ready():
	pass
	
func _process(delta):
	if hp==0:
		$"../Gameover".z_index+=30000
	
	delta=delta

func on_hit():
	hp-=1
	cframe+=1
	$movinge.frame=cframe
	print("-1")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_heal():
	hp+=1
	cframe-=1
	$movinge.frame=cframe
	print("+1")
	
