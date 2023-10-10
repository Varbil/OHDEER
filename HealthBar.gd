extends Control
var max_hp:=6
var hp :=6 
var cframe:=0 #curret frame


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

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
	

