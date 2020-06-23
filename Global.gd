extends Node

const Minigames = ["Jumper","Coin Chase"]

var ControllerCat = 1
var ControllerDog = 0
var Rounds = 0
var RoundsPlayed = 0
var PointsCat = 0
var PointsDog = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var dir = Directory.new()
	dir.open("res://Minigames/")
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with(".") and file.get_extension() == ".tscn":
			Minigames.append(file)

	dir.list_dir_end()



func MinigameWon(DoggoWon):
	if DoggoWon:
		PointsDog += 1
	else:
		PointsCat +=1
	RoundsPlayed += 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
