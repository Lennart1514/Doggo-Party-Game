extends StaticBody2D



func _ready():
	position.x = randi()%1024-50
	
	if get_parent().name != "Starting Platforms":
		if randi()%100+1 < (get_parent().Score*-1)/100:
			queue_free()



func _on_DeathBox_area_entered(_area):
	queue_free()
