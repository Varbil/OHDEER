extends Sprite

var player : Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	player = $"../player"
	position = player.position
# Called when the node enters the scene tree for the first time.

#func _process(delta):
#	position.x -= (position.x-player.position.x)
#	position.y -= (position.y-player.position.y)
	
	pass
