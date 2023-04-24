extends Control

var PlayerName
var PlayerScore
var nameLabel

func _ready():
	PlayerName = get_node("/root/CanvasLayer/Control/LineEdit")
	#var leaderboard = load("res://leaderboard.tscn").instantiate()
	#add_child(leaderboard)
	#nameLabel = leaderboard.get_node("Place")
	
	

	
func _on_submit_button_pressed():
	PlayerScore = GlobalScore.score
	var player_name_text = PlayerName.get_text()
	
	#nameLabel.text = player_name_text
	print(nameLabel)
	print(player_name_text, " ", PlayerScore)
	GlobalScore.score = 0
	get_tree().change_scene_to_file("res://leaderboard.tscn") 
	# do something with the player_name_text variable
	#hide true false
	#use loading methods
