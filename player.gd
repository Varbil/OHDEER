extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score : int = 0

var hp = 3

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
		$AnimatedSprite.flip_h=true
		
	if Input.is_action_pressed("ui_right"):
		vel.x += speed
		$AnimatedSprite.flip_h=false
	
	vel = move_and_slide(vel, Vector2.UP)
	
	vel.y += gravity * delta
	
	if Input.is_action_pressed("ui_up") and is_on_floor():
		vel.y -= jumpForce
	
	
