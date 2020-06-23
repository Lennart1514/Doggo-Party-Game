extends Node2D


# Declare member variables here. Examples:
# var a = 2
var DoggoP = 0
var CattoP = 0
var RandomV = 0
var RandomH = 0

onready var CattoController = Global.ControllerCat
onready var DoggoController = Global.ControllerDog

# Called when the node enters the scene tree for the first time.
func _ready():
	CoinPos()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#
func _process(delta):
	get_node("Doggo").move_and_collide(Vector2((200 * Input.get_joy_axis(DoggoController, JOY_ANALOG_LX) * delta),0) )
	get_node("Doggo").move_and_collide(Vector2(DoggoController,( 200 * Input.get_joy_axis(DoggoController, JOY_ANALOG_LY) * delta)) )
	if Input.get_joy_axis(DoggoController,JOY_ANALOG_LX) > 0.5 and  abs(Input.get_joy_axis(DoggoController,JOY_ANALOG_LY)) < 0.2:
		get_node("Doggo/AnimatedDoggo").play("RL")
		get_node("Doggo/AnimatedDoggo").flip_h = false
	if Input.get_joy_axis(DoggoController,JOY_ANALOG_LX) < -0.5 and abs(Input.get_joy_axis(DoggoController,JOY_ANALOG_LY)) > -0.2:
		get_node("Doggo/AnimatedDoggo").play("RL")
		get_node("Doggo/AnimatedDoggo").flip_h = true
	
	elif Input.get_joy_axis(DoggoController,JOY_ANALOG_LY) > 0.2:
		get_node("Doggo/AnimatedDoggo").play("Down")
	elif Input.get_joy_axis(DoggoController,JOY_ANALOG_LY) < -0.2:
		get_node("Doggo/AnimatedDoggo").play("Up")
		
	get_node("Catto").move_and_collide(Vector2((200 * Input.get_joy_axis(CattoController, JOY_ANALOG_LX) * delta),0) )
	get_node("Catto").move_and_collide(Vector2(0,( 200 * Input.get_joy_axis(CattoController, JOY_ANALOG_LY) * delta)) )
	if Input.get_joy_axis(CattoController,JOY_ANALOG_LX) > 0.5 and  abs(Input.get_joy_axis(CattoController,JOY_ANALOG_LY)) < 0.2:
		get_node("Catto/AnimatedDoggo").play("RL")
		get_node("Catto/AnimatedDoggo").flip_h = false
	if Input.get_joy_axis(CattoController,JOY_ANALOG_LX) < -0.5 and abs(Input.get_joy_axis(CattoController,JOY_ANALOG_LY)) > -0.2:
		get_node("Catto/AnimatedDoggo").play("RL")
		get_node("Catto/AnimatedDoggo").flip_h = true
	
	elif Input.get_joy_axis(CattoController,JOY_ANALOG_LY) > 0.2:
		get_node("Catto/AnimatedDoggo").play("Down")
	elif Input.get_joy_axis(CattoController,JOY_ANALOG_LY) < -0.2:
		get_node("Catto/AnimatedDoggo").play("Up")
	
	
		
func CoinPos():
	randomize()
	RandomV = randi()%500+1
	RandomH = randi()%950+50

	$Coin.position = Vector2(RandomH, RandomV)
	
		
		
	

	
	




func _on_Coin_body_entered(body):
	if body == get_node("Doggo"):
		Input.start_joy_vibration(DoggoController, 0.3, 0.1, 0.5)
		DoggoP +=1
		$DoggoP.text = str(DoggoP) + " / 20"
		CoinPos()
		if DoggoP == 20:
			Global.MinigameWon(true)
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://Title Screen.tscn")
	if body == get_node("Catto"):
		Input.start_joy_vibration(CattoController, 0.3, 0.1, 0.5)
		CattoP +=1
		$CattoP.text = str(CattoP) + " / 20"
		CoinPos()
		if CattoP == 20:
			
			Global.MinigameWon(false)
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://Title Screen.tscn")
	pass # Replace with function body.
