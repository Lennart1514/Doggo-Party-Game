extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
var jumping
var jump_speed = 100
var run_speed = 1
var Gravity = 100
var Controller = 0
var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(delta):
	
	var right = Input.get_joy_axis(Controller,JOY_ANALOG_LX)
	var jump = Input.is_joy_button_pressed(Controller,JOY_XBOX_A)
	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed
	velocity.x += run_speed*right
	print(right)



	velocity.y += Gravity * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
