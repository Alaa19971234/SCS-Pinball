extends Node3D

var coin: AudioStreamPlayer3D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Find the AudioStreamPlayer3D node by name
	coin = get_node("coin") as AudioStreamPlayer3D

	# Load the sound file and set it as the stream for the AudioStreamPlayer3D node
	coin.stream = load("res://sounds/coin.wav")
	# Play the sound
	coin.play()

