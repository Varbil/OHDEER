extends Node2D
var max_hp:=6
var hp :=6 
var cframe:=0 #curret frame


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func on_hit():
	hp-=1
	cframe+=1
	$"Healtbar moving".frame=cframe
	print("-1")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_heal():
	hp+=1
	cframe-=1
	$"Healtbar moving".frame=cframe
	print("+1")
	
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		on_hit()
	if Input.is_action_just_pressed("ui_left"):
		on_heal()
	if hp<=7:
		hp=6
	if hp>=0:
		hp=0
	var hehe = delta
	hehe+=hehe
	pass
