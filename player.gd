extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score : int = 0

var hp = 3

onready var bounce_raycast = $BounceRaycast

var speed : int = 200
var jumpForce : int = 600
var gravity : int = 800

var vel : Vector2 = Vector2()
var grounded : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	vel.x = 0
	
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed
		
	if Input.is_action_pressed("ui_right"):
		vel.x += speed
	
	vel = move_and_slide(vel, Vector2.UP)
	
	vel.y += gravity * delta
	
	if Input.is_action_pressed("ui_up") and is_on_floor():
		vel.y -= jumpForce
	
	_check_bounce(delta)
	
func _check_bounce(delta):
	if vel.y > 0:
		for raycast in bounce_raycast.get_children():
			raycast.cast_to = Vector2.DOWN * vel * delta
			raycast.force_raycast_update()
			if raycast.is_colliding() && raycast.get_collision_normal() == Vector2.UP:
				vel.y -= jumpForce
				$"../enitity/enemy1".position=Vector2(3000,3000)



func _on_Area2D_body_entered(body):
	if body.name=="player":
		$"../../EndScene".on_hit()
	pass # Replace with function body.
