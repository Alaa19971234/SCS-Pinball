extends RigidBody3D
var live1
var live2
var return_box
var starting_base
var FloorBreak
var BreakRestorePoint
var SouthWallBreak2
var SouthWallBreak
var NorthWallBreak2
var NorthWallBreak
var WestWallBreak2
var WestWallBreak
var EastWallBreak2
var EastWallBreak
var ball: AudioStreamPlayer3D


func _ready():
	ball = get_node("ballSound") as AudioStreamPlayer3D
	live1 = get_node("/root/PinballMap/ScoreLabel/liveIcon")
	live2 = get_node("/root/PinballMap/ScoreLabel/liveIcon2")
	live1.visible = true
	live2.visible = true

	starting_base = get_node_or_null("/root/PinballMap/collisions&meshes/StartingBase")
	return_box = get_node_or_null("/root/PinballMap/collisions&meshes/ReturnBox")

	FloorBreak = get_node_or_null("/root/PinballMap/collisions&meshes/FloorBreak")
	EastWallBreak = get_node_or_null("/root/PinballMap/collisions&meshes/EastWallBreak")
	EastWallBreak2 = get_node_or_null("/root/PinballMap/collisions&meshes/EastWallBreak2")
	WestWallBreak = get_node_or_null("/root/PinballMap/collisions&meshes/WestWallBreak")
	WestWallBreak2 = get_node_or_null("/root/PinballMap/collisions&meshes/WestWallBreak2")
	NorthWallBreak = get_node_or_null("/root/PinballMap/collisions&meshes/NorthWallBreak")
	NorthWallBreak2 = get_node_or_null("/root/PinballMap/collisions&meshes/NorthWallBreak2")
	SouthWallBreak = get_node_or_null("/root/PinballMap/collisions&meshes/SouthWallBreak")
	SouthWallBreak2 = get_node_or_null("/root/PinballMap/collisions&meshes/SouthWallBreak2")
	BreakRestorePoint = get_node_or_null("/root/PinballMap/collisions&meshes/BreakRestorePoint")
	
	
func _process(delta):
	pass
	
func _on_ball_body_entered(body):
	#print("Collided with:", body.get_name())
	#print("Parent node:", body.get_parent().get_name()) # Add this line to print the name of the parent node
	
	# Check if the ball has broken the walls and collided with the exterior
	if body in [FloorBreak, EastWallBreak, EastWallBreak2, WestWallBreak, WestWallBreak2, NorthWallBreak, NorthWallBreak2, SouthWallBreak, SouthWallBreak2]:
		#print("wall break")
		GlobalScore.score += 100
		BreakRestorePoint = get_node_or_null("/root/PinballMap/collisions&meshes/BreakRestorePoint")
		if BreakRestorePoint:
		# Set the ball's position to the position of the starting base next to the plunger
			set_position(Vector3(BreakRestorePoint.get_position().x , BreakRestorePoint.get_position().y, BreakRestorePoint.get_position().z))

			# Reset the ball's velocity and angular velocity
			set_linear_velocity(Vector3.ZERO)
			set_angular_velocity(Vector3.ZERO)
			
			# Show the "Wall break" message
			var wall_break_label = get_node("/root/PinballMap/ScoreLabel/AnimationPlayer/WallBreak")
			wall_break_label.visible = true
			
			var animation_player = get_node("/root/PinballMap/ScoreLabel/AnimationPlayer")
			animation_player.play("wall_break_animation")
			
			# Hide the label after 2 seconds
			await get_tree().create_timer(1).timeout
			wall_break_label.visible = false

	# Check if the ball has collided with the return box
	if body == return_box:
		if live1.visible == false:
			live2.visible = false
		live1.visible = false
		GlobalScore.lives -= 1
		GlobalScore.bank_Level = 0
		#Bank_level = 0
		if GlobalScore.lives == 0:
			print("Game Over")
			get_tree().change_scene_to_file("res://MainScreen.tscn")  #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< name first, compare scores later
			get_tree().change_scene_to_file("res://PlayerName.tscn")
		starting_base = get_node_or_null("/root/PinballMap/collisions&meshes/StartingBase")
		if starting_base:
			# Set the ball's position to the position of the starting base next to the plunger
			set_position(Vector3(starting_base.get_position().x - 1.5 , starting_base.get_position().y - 4, starting_base.get_position().z - 8.0))

			# Reset the ball's velocity and angular velocity
			set_linear_velocity(Vector3.ZERO)
			set_angular_velocity(Vector3.ZERO)
	elif body.is_in_group("bumper"):
		#print("ball!")
		body.call("on_bumper_hit", self)
