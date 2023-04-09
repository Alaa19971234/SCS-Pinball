extends CharacterBody3D

var coin: AudioStreamPlayer3D

@export var bumper_force = 5
# Store references to the bumper meshes
var copper
var gold
var diamond
var sound_player
func _ready():
	# Get references to the bumper meshes
	# Find the AudioStreamPlayer3D node by name
	coin = get_node("coin") as AudioStreamPlayer3D
	# Load the sound file and set it as the stream for the AudioStreamPlayer3D node
	coin.stream = load("res://sounds/coin.wav")
	# Play the sound
	
	copper = get_node("copper")
	gold = get_node("gold")
	diamond = get_node("diamond")


func _process(delta):
		# Play the sound effect
		if GlobalScore.score <= 100:
			#copper bumper
			copper.visible = true
			gold.visible = false
			diamond.visible = false
			
		if GlobalScore.score >= 100 && GlobalScore.score <= 1000:
			bumper_force = 10
			#copper bumper disappears and gold bumper appears
			copper.visible = false
			gold.visible = true
			diamond.visible = false
			
		if GlobalScore.score >= 1000 && GlobalScore.score <= 10000:
			bumper_force = 15
			#gold bumper disappears and diamond bumper appears
			copper.visible = false
			gold.visible = false
			diamond.visible = true


func on_bumper_hit(body):
	# Play the sound effect
	coin.play()
	print("worked!")
	if body.is_in_group("ball"):
		print("bumper!")
		var ball_velocity = body.linear_velocity
		var bumper_direction = (body.global_transform.origin - global_transform.origin).normalized()
		var bumper_impulse = bumper_direction * bumper_force
		body.apply_impulse(bumper_impulse, Vector3.ZERO)
		
		# Check the score and change the visibility of the meshes accordingly
		if GlobalScore.score <= 100:
			#copper bumper
			GlobalScore.score += 10
			print("Score:", GlobalScore.score)
			copper.visible = true
			gold.visible = false
			diamond.visible = false
			
		if GlobalScore.score >= 100 && GlobalScore.score <= 1000:
			#copper bumper disappears and gold bumper appears
			GlobalScore.score += 100
			print("Score:", GlobalScore.score)
			copper.visible = false
			gold.visible = true
			diamond.visible = false
			
		if GlobalScore.score >= 1000 && GlobalScore.score <= 10000:
			#gold bumper disappears and diamond bumper appears
			GlobalScore.score += 1000
			print("Score:", GlobalScore.score)
			copper.visible = false
			gold.visible = false
			diamond.visible = true
