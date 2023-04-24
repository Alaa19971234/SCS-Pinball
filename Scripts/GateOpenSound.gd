extends Node3D

var GateOpen: AudioStreamPlayer3D
# Called when the node enters the scene tree for the first time.
func _ready():
	GateOpen = get_node("GateOpen") as AudioStreamPlayer3D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_bumper_hit(body):
	#print("GATE")
	GateOpen.play() 
