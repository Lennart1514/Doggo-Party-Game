extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var DogReady = false
var CatReady = false
var WaitReady = false
var Inputwaiting = null
var GameID
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$CenterContainer/VBoxContainer/PointsCat.text = "Cat Points:" + str(Global.PointsCat)
	$CenterContainer/VBoxContainer/PointsDog.text = "Dog Points:" + str(Global.PointsDog)
	if Global.RoundsPlayed < Global.Rounds:
		StartRound()

func StartRound():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	GameID = randi()%Global.Minigames.size()
	
	$"Game Description/Panel/Name".text = Global.Minigames[GameID]
	if Directory.new().file_exists("res://Minigames/"+Global.Minigames[GameID]+"/description.txt"):
		var f = File.new()
		var err = f.open("res://Minigames/"+Global.Minigames[GameID]+"/description.txt", File.READ)
		if err != OK:
			printerr("Could not open file, error code ", err)
		var text = f.get_as_text()
		f.close()
		$"Game Description/Panel/CenterContainer2/HBoxContainer/VBoxContainer/Description".text = text
		
	if Directory.new().file_exists("res://Minigames/"+Global.Minigames[GameID]+"/preview.png"):
		$"Game Description/Panel/CenterContainer2/HBoxContainer/VBoxContainer/TextureRect".texture = load("res://Minigames/"+Global.Minigames[GameID]+"/preview.png")
	$"Game Description".popup()
	WaitReady = true
	
	
# warning-ignore:return_value_discarded
	
func _input(event):
	if Inputwaiting == "Dog" and event != InputEventJoypadButton and event.is_pressed():
		Global.ControllerDog = event.device
		Input.start_joy_vibration(event.device, 0.1, 0.1 , 0.5)
		$"Start Game/Panel/CenterContainer2/HBoxContainer/Doggo Box/ControllerButtonDog".disabled = false
		$"Start Game/Panel/CenterContainer2/HBoxContainer/Doggo Box/Label".text = "Controller:"+str(event.device+1)
		Inputwaiting = null
		updatePlayButton()
	if Inputwaiting == "Cat" and event != InputEventJoypadButton and event.is_pressed():
		Global.ControllerCat = event.device
		Input.start_joy_vibration(event.device, 0.1, 0.1 , 0.5)
		$"Start Game/Panel/CenterContainer2/HBoxContainer/Catto Box/ControllerButtonCat".disabled = false
		$"Start Game/Panel/CenterContainer2/HBoxContainer/Catto Box/Label".text = "Controller:"+str(event.device+1)
		Inputwaiting = null
		updatePlayButton()
		
	if WaitReady and event != InputEventJoypadButton and event.is_pressed():
		if event.device == Global.ControllerCat:
			CatReady = true
			$"Game Description/Panel/CenterContainer2/HBoxContainer/Catto Box/Label".text = "Ready"
		if event.device == Global.ControllerDog:
			DogReady = true
			$"Game Description/Panel/CenterContainer2/HBoxContainer/Doggo Box/Label".text = "Ready"
		
	if DogReady and CatReady:
		get_tree().change_scene("res://Minigames/"+Global.Minigames[GameID]+".tscn")

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
	Global.PointsCat = 0
	Global.PointsDog = 0
	Global.RoundsPlayed = 0
	Global.Rounds = $"Start Game/Panel/CenterContainer2/HBoxContainer/VBoxContainer/HBoxContainer/RoundNumber".value
	StartRound()
	$"Start Game/Panel/CenterContainer2/HBoxContainer/VBoxContainer/Start".disabled = true


func _on_Fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen


func _on_Quit_pressed():
	get_tree().quit()
