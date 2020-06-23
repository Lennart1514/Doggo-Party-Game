extends KinematicBody2D


# Declare member variables here. Examples:
var jumping
var jump_speed = -300
var run_speed = 5
var Gravity = 150
var Controller = 0
var velocity = Vector2()

export var Dog = true
# Called when the node enters the scene tree for the first time.
func _ready():
	if Dog :
		Controller = Global.ControllerDog
	else:
		Controller = Global.ControllerCat


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if position.x < 0 :
		position.x = 1024
	if position.x > 1024 :
		position.x = 0
func _physics_process(delta):
	
	var right = Input.get_joy_axis(Controller,JOY_ANALOG_LX)
	if $RayCast2D.get_collider() != null and velocity.y >= 0 :
		jumping = true
		velocity.y = jump_speed
	velocity.x += run_speed*right



	if $RayCast2D.get_collider() == null:
		velocity.y += Gravity * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if $DeathDetector.get_collider() != null:
		Global.MinigameWon(Dog)
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Title Screen.tscn")
