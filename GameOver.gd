extends Node2D

var player :Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	player = $"../Player"
	position = player.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= (position.x-player.position.x)
	position.y -= (position.y-player.position.y)
