extends CharacterBody3D

@export var bumper_force = 20
var SouthBump: AudioStreamPlayer3D

#var gate
#var gate_collision

func _ready():
	add_to_group("bumpers")
	SouthBump = get_node("SouthBump") as AudioStreamPlayer3D
	#gate = get_node_or_null("/root/Level/Gate/GateCollision")
	#gate_collision = gate.get_node_or_null("GateCollision")
	#gate_collision.disabled = true

func on_bumper_hit(body):
	# Add any behavior or events you want to trigger here
	SouthBump.play()
	#print("worked!")
	if body.is_in_group("ball"):
		#print("bumper!")
		var ball_velocity = body.linear_velocity
		var bumper_direction = (body.global_transform.origin - global_transform.origin).normalized()
		var bumper_impulse = bumper_direction * bumper_force
		body.apply_impulse(bumper_impulse, Vector3.ZERO)
		# increment the global score variable by 10 points
		GlobalScore.score += 10
		#print("Score:", GlobalScore.score)
		#gate_collision.disabled = false
