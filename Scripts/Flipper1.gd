extends CharacterBody3D

@export var flipper_speed = 15  # adjust the speed of the flipper rotation

var flipper_rot = -0.35  # keep track of the current flipper rotation
var flip: AudioStreamPlayer3D

func _ready():
	flip = get_node("flipper") as AudioStreamPlayer3D

func _input(event):
		if event.is_action_pressed("flipper"):
			flip.play() 
			flipper_rot = 1  # set the flipper rotation to a negative value to make it rotate upwards
		elif event.is_action_released("flipper"):
			flipper_rot = -0.35  # set the flipper rotation back to 0 to stop the rotation

func _physics_process(delta):
	# apply the flipper rotation to the flipper using the rotate_y function
	var rot = self.rotation
	rot.y = lerp(rot.y as float, flipper_rot as float, delta * flipper_speed)
	self.rotation = rot
