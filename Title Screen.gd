extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Inputwaiting = null
# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer/VBoxContainer/PointsCat.text = "Cat Points:" + str(Global.PointsCat)
	$CenterContainer/VBoxContainer/PointsDog.text = "Dog Points:" + str(Global.PointsDog)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if Inputwaiting == "Dog" and event != InputEventJoypadButton and event.is_pressed():
		Global.ControllerDog = event.device
		$"Start Game/Panel/CenterContainer2/HBoxContainer/Doggo Box/ControllerButtonDog".disabled = false
		$"Start Game/Panel/CenterContainer2/HBoxContainer/Doggo Box/Label".text = "Controller:"+str(event.device+1)
		Inputwaiting = null
		updatePlayButton()
	if Inputwaiting == "Cat" and event != InputEventJoypadButton and event.is_pressed():
		Global.ControllerCat = event.device
		$"Start Game/Panel/CenterContainer2/HBoxContainer/Catto Box/ControllerButtonCat".disabled = false
		$"Start Game/Panel/CenterContainer2/HBoxContainer/Catto Box/Label".text = "Controller:"+str(event.device+1)
		Inputwaiting = null
		updatePlayButton()

func _on_Play_pressed():
	$"Start Game".popup()

func updatePlayButton():
	if Global.ControllerCat != null and Global.ControllerDog != null and Global.ControllerCat != Global.ControllerDog:
		$"Start Game/Panel/CenterContainer2/HBoxContainer/VBoxContainer/Start".disabled = false
	else:
		$"Start Game/Panel/CenterContainer2/HBoxContainer/VBoxContainer/Start".disabled = true
func _on_ControllerButtonCat_pressed():
	$"Start Game/Panel/CenterContainer2/HBoxContainer/Catto Box/ControllerButtonCat".disabled = true
	$"Start Game/Panel/CenterContainer2/HBoxContainer/Catto Box/Label".text = "Push a button"
	Inputwaiting = "Cat"

func _on_ControllerButtonDog_pressed():
	$"Start Game/Panel/CenterContainer2/HBoxContainer/Doggo Box/ControllerButtonDog".disabled = true
	$"Start Game/Panel/CenterContainer2/HBoxContainer/Doggo Box/Label".text = "Push a button"
	Inputwaiting = "Dog"


func _on_Start_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_tree().change_scene("res://Minigame01.tscn")


func _on_Fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
