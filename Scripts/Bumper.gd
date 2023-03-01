extends KinematicBody

export var bumper_force = 20

func on_bumper_hit(body):
	# Add any behavior or events you want to trigger here
	if body.is_in_group("ball"):
		print("bumper!");
		var ball_velocity = body.linear_velocity
		var bumper_direction = (body.global_transform.origin - global_transform.origin).normalized()
		var bumper_impulse = bumper_direction * bumper_force
		body.apply_impulse(Vector3.ZERO, bumper_impulse)
		pass
