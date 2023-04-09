extends CharacterBody3D

@export var plunger_speed = 50
@export var max_plunger_distance = 0
@export var min_plunger_scale = 6
@export var plunger_force = 100
var plunger_distance = 0
var plunger_scale = Vector3(1, 4, 1)
#var gate
#var gate_collision

func _ready():
	#gate = get_node_or_null("/root/Level/Gate")
	#gate_collision = gate.get_node_or_null("GateCollision")
	#gate_collision.disabled = true
	pass


func _input(event):
	if event.is_action_pressed("pull_plunger"):
		plunger_distance = max_plunger_distance
		plunger_scale = Vector3(1, min_plunger_scale, 1)
	elif event.is_action_released("pull_plunger"):
		plunger_distance = 0
		plunger_scale = Vector3(1, 4, 1)

func _physics_process(delta):
	var movement = Vector3(0, 0, +plunger_distance)
	movement *= delta * plunger_speed
	self.position += movement
	self.scale = plunger_scale
	if plunger_scale.y < 1:
		plunger_scale.y += delta / 2


func on_bumper_hit(body):
	# Add any behavior or events you want to trigger here
	if body.is_in_group("ball"):
		print("plunger!");
		#gate_collision.disabled = true
		var ball_velocity = body.linear_velocity
		var plunger_direction = (body.global_transform.origin - global_transform.origin).normalized()
		var plunger_impulse = plunger_direction * plunger_force
		body.apply_impulse(plunger_impulse, Vector3.ZERO)
		pass
