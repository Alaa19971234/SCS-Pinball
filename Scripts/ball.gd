extends RigidBody3D

var plunger
var return_box
var starting_base
var board

func _ready():
	# Find the Plunger and StartingBase nodes
		# Find the Board node
	board = get_node_or_null("/root/Level/Pinball map")
	
	plunger = get_node_or_null("/root/Level/Plunger")
	starting_base = get_node_or_null("/root/Level/StartingBase")
	
	# Find the ReturnBox node
	return_box = get_node_or_null("/root/Level/ReturnBox")

func _on_ball_body_entered(body):
	
	print("Collided with:", body.get_name())
	print("Parent node:", body.get_parent().get_name()) # Add this line to print the name of the parent node
	
	# Check if the ball has collided with the return box
	if body == return_box:
		starting_base = get_node_or_null("/root/Level/StartingBase")
		if starting_base:
			# Set the ball's position to the position of the starting base next to the plunger
			set_position(Vector3(starting_base.get_position().x - 3 , starting_base.get_position().y - 3, starting_base.get_position().z - 8.0))

			# Reset the ball's velocity and angular velocity
			set_linear_velocity(Vector3.ZERO)
			set_angular_velocity(Vector3.ZERO)
	elif body.is_in_group("bumper"):
		print("ball!")
		body.call("on_bumper_hit", self)
