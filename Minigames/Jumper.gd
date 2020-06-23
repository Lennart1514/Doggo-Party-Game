extends Node2D


var Score = 0
var Controller

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(_delta):
	
	$Camera2D/CenterContainer/Score.text = "Score:" + str(round(abs(Score)))
	
	if $"Player Doggo".position.y -100 < $Camera2D.position.y:
		$Camera2D.position.y = $"Player Doggo".position.y -100
		
	if $"Player Catto".position.y -100 < $Camera2D.position.y:
		$Camera2D.position.y = $"Player Catto".position.y -100
	
	if $Camera2D.position.y +30 < Score:
		Score = $Camera2D.position.y
		var platform = load("res://Minigames/Jumper/Platform.tscn").instance()
		platform.position.y = $Camera2D.position.y
		add_child(platform)
	

