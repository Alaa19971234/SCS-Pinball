extends Node3D

var start_label: Label
var selection_node: Control
var new_game_button: Button
var leaderboard_button: Button
var OptionSelectionSound: AudioStreamPlayer3D

func _ready():
	OptionSelectionSound = get_node("OptionSelectionSound") as AudioStreamPlayer3D
	set_process_input(true)
	
	start_label = get_node("/root/MainScreen/MAIN MENU/start_label") as Label
	
	selection_node = load("res://selection_options.tscn").instantiate() as Control
	new_game_button = load("res://selection_options.tscn").instantiate() as Button
	leaderboard_button = load("res://selection_options.tscn").instantiate() as Button
	add_child(selection_node)
	
	new_game_button = selection_node.get_node("new_game_button")
	leaderboard_button = selection_node.get_node("leaderboard_button")
	
	start_label.show()
	new_game_button.hide()
	leaderboard_button.hide()
	
	new_game_button.connect("pressed", on_new_game_pressed)
	leaderboard_button.connect("pressed", on_leaderboard_pressed)
	
	
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		print("pressed!!!")
		OptionSelectionSound.play()
		start_label.hide()
		new_game_button.show()
		leaderboard_button.show()
		
func on_new_game_pressed():
	get_tree().change_scene_to_file("res://Meshes/PinballMap.tscn")
	
func on_leaderboard_pressed():
	get_tree().change_scene_to_file("res://leaderboard.tscn")
