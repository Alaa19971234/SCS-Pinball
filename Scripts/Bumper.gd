extends CharacterBody3D

@export var bumper_force = 40

func _ready():
	add_to_group("bumpers")

func on_bumper_hit(body):
	# Add sany behavior or events you want to trigger here
	print("worked!")
	if body.is_in_group("ball"):
		print("bumper!")
		var ball_velocity = body.linear_velocity
		var bumper_direction = (body.global_transform.origin - global_transform.origin).normalized()
		var bumper_impulse = bumper_direction * bumper_force
		body.apply_impulse(bumper_impulse, Vector3.ZERO)
		# increment the global score variable by 10 points
		GlobalScore.score += 10
		print("Score:", GlobalScore.score)
		pass
