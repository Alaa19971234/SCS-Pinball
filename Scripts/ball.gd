extends RigidBody

func _on_ball_body_entered(body):
	if body.is_in_group("bumper"):
		print("ball!");
		body.call("on_bumper_hit", self)
