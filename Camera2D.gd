extends Camera2D

var player : Node2D
export var easingSpeed : float = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	player = $"../enitity/player"
	position = player.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= (position.x-player.position.x)*easingSpeed*delta
	position.y -= (position.y-player.position.y)*easingSpeed*delta
