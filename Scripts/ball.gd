extends RigidBody

var collision_detected = false

func _ready():
	# Connect the body_entered signal to the ball
	connect("body_entered", self, "_on_ball_body_entered")

func _process(delta):
	# After a collision with an object
	if collision_detected:
		# Check the ball's Y velocity
		var y_velocity = get_linear_velocity().y
		# Set a minimum Y velocity
		var min_y_velocity = -500 # Change this to suit your game
		# Clamp the Y velocity to the minimum value
		var new_velocity = Vector3(get_linear_velocity().x, max(y_velocity, min_y_velocity), get_linear_velocity().z)
		# Apply impulse to set the new velocity
		apply_impulse(Vector3.ZERO, new_velocity - get_linear_velocity())
		# Reset the collision_detected flag
		collision_detected = false

func _on_ball_body_entered(body):
	if body.is_in_group("bumper"):
		print("ball!")
		body.call("on_bumper_hit", self)
	# Set the collision_detected flag
	collision_detected = true
