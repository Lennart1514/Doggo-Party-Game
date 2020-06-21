extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#
func _process(delta):
	get_node("Doggo").move_and_collide(Vector2((200 * Input.get_joy_axis(0, JOY_ANALOG_LX) * delta),0) )
	get_node("Doggo").move_and_collide(Vector2(0,( 200 * Input.get_joy_axis(0, JOY_ANALOG_LY) * delta)) )
	if Input.get_joy_axis(0,JOY_ANALOG_LX) > 0.5 and  abs(Input.get_joy_axis(0,JOY_ANALOG_LY)) < 0.2:
		get_node("Doggo/AnimatedDoggo").play("RL")
		get_node("Doggo/AnimatedDoggo").flip_h = false
	if Input.get_joy_axis(0,JOY_ANALOG_LX) < -0.5 and abs(Input.get_joy_axis(0,JOY_ANALOG_LY)) > -0.2:
		get_node("Doggo/AnimatedDoggo").play("RL")
		get_node("Doggo/AnimatedDoggo").flip_h = true
	
	elif Input.get_joy_axis(0,JOY_ANALOG_LY) > 0.2:
		get_node("Doggo/AnimatedDoggo").play("Down")
	elif Input.get_joy_axis(0,JOY_ANALOG_LY) < -0.2:
		get_node("Doggo/AnimatedDoggo").play("Up")
		
	get_node("Catto").move_and_collide(Vector2((200 * Input.get_joy_axis(1, JOY_ANALOG_LX) * delta),0) )
	get_node("Catto").move_and_collide(Vector2(0,( 200 * Input.get_joy_axis(1, JOY_ANALOG_LY) * delta)) )
	if Input.get_joy_axis(1,JOY_ANALOG_LX) > 0.5 and  abs(Input.get_joy_axis(1,JOY_ANALOG_LY)) < 0.2:
		get_node("Catto/AnimatedDoggo").play("RL")
		get_node("Catto/AnimatedDoggo").flip_h = false
	if Input.get_joy_axis(1,JOY_ANALOG_LX) < -0.5 and abs(Input.get_joy_axis(1,JOY_ANALOG_LY)) > -0.2:
		get_node("Catto/AnimatedDoggo").play("RL")
		get_node("Catto/AnimatedDoggo").flip_h = true
	
	elif Input.get_joy_axis(1,JOY_ANALOG_LY) > 0.2:
		get_node("Catto/AnimatedDoggo").play("Down")
	elif Input.get_joy_axis(1,JOY_ANALOG_LY) < -0.2:
		get_node("Catto/AnimatedDoggo").play("Up")
	
	
		
		
	
		
		
	

	
	
