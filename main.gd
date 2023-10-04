extends KinematicBody2D

export (int) var walk_speed = 50
export (int) var gravity = 2000
onready var visibility =$VisibilityNotifier2D

var velocity := Vector2.ZERO
var x_direction = -1

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if visibility.is_on_screen():
		velocity.x = walk_speed * x_direction
		velocity.y = gravity * delta
		velocity = move_and_slide(velocity, Vector2.UP)
		if is_on_wall():
			x_direction = -x_direction


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
