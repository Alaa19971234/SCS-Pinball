extends KinematicBody

export var plunger_speed = 50
export var max_plunger_distance = 0
export var min_plunger_scale = 2

var plunger_distance = 0
var plunger_scale = Vector3(1, 4, 1)

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
	self.translation += movement
	self.scale = plunger_scale
	if plunger_scale.y < 1:
		plunger_scale.y += delta / 2
