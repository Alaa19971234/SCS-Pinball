extends CharacterBody3D

@export var flipper_speed = 15  # adjust the speed of the flipper rotation

var flipper_rot = 3.5  # keep track of the current flipper rotation

func _ready():
	pass  # add any initialization code here

func _input(event):
	if event.is_action_pressed("flipper"):
		flipper_rot = 2.2  # set the flipper rotation to a negative value to make it rotate upwards
	elif event.is_action_released("flipper"):
		flipper_rot = 3.5  # set the flipper rotation back to 0 to stop the rotation


func _physics_process(delta):
	# apply the flipper rotation to the flipper using the rotate_y function
	var rot = self.rotation
	rot.y = lerp(rot.y as float, flipper_rot as float, delta * flipper_speed)
	self.rotation = rot
