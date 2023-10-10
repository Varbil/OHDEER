extends KinematicBody2D

# physics
const speed = 200
var jumpForce = 500
const gravity  = 750

var vel = Vector2(0,0)
var grounded = false

onready var bounce_raycast = $"../player/BounceRaycast"

# components
onready var sprite = $Sprite


func _physics_process(delta):
	# reset horizontal velocity
	vel.x = 0

	# movement inputs
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed
	if Input.is_action_pressed("ui_right"):
		vel.x += speed

	# bounce
	_check_bounce(delta)

	# applying the velocity
	vel = move_and_slide(vel, Vector2.UP)

	# gravity
	vel.y += gravity * delta

	# jump input
	if Input.is_action_pressed("ui_up") and is_on_floor():
		vel.y -= jumpForce

func _check_bounce(delta):
	if vel.y > 0:
		for raycast in bounce_raycast.get_children():
			raycast.cast_to = Vector2.DOWN * vel * delta
			raycast.force_raycast_update()
			if raycast.is_colliding() && raycast.get_collision_normal() == Vector2.UP:
				vel.y -= jumpForce
