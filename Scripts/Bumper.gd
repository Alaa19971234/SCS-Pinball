extends CharacterBody3D

var coin: AudioStreamPlayer3D
var Levelup: AudioStreamPlayer3D
var BumperLight

@export var bumper_force = 5
# Store references to the bumper meshes
var copper
var gold
var diamond
var sound_player
var LevelupMusic
func _ready():
	
	BumperLight = get_node("OmniLight3D")
	BumperLight.visible = false
	LevelupMusic = true
	# Get references to the bumper meshes
	# Find the AudioStreamPlayer3D node by name
	coin = get_node("coin") as AudioStreamPlayer3D
	Levelup = get_node("LevelupMusic") as AudioStreamPlayer3D
	# Load the sound file and set it as the stream for the AudioStreamPlayer3D node
	coin.stream = load("res://sounds/coin.wav")
	# Play the sound
	
	copper = get_node("copper")
	gold = get_node("gold")
	diamond = get_node("diamond")


func _process(delta):
	
		# Play the sound effect
		if GlobalScore.bank_Level <= 20:
			
			#copper bumper
			copper.visible = true
			gold.visible = false
			diamond.visible = false
			
		if GlobalScore.bank_Level >= 20 && GlobalScore.bank_Level <= 100:
			if LevelupMusic == true:
				Levelup.play()
				LevelupMusic = false
			bumper_force = 10
			#copper bumper disappears and gold bumper appears
			copper.visible = false
			gold.visible = true
			diamond.visible = false
			
		if GlobalScore.bank_Level >= 100:
			if LevelupMusic == false:
				Levelup.play()
				LevelupMusic = true
			bumper_force = 15
			#gold bumper disappears and diamond bumper appears
			copper.visible = false
			gold.visible = false
			diamond.visible = true


func on_bumper_hit(body):
	if body.is_in_group("ball"):
		coin.play()
		GlobalScore.bank_Level += 1
		BumperLight.visible = true
		var ball_velocity = body.linear_velocity
		var bumper_direction = (body.global_transform.origin - global_transform.origin).normalized()
		var bumper_impulse = bumper_direction * bumper_force
		body.apply_impulse(bumper_impulse, Vector3.ZERO)
		await(get_tree().create_timer(0.1).timeout)
		BumperLight.visible = false
		
		
		# Check the score and change the visibility of the meshes accordingly
		if GlobalScore.bank_Level <= 20:
			#copper bumper
			GlobalScore.score += 10
			print(GlobalScore.bank_Level)
			#print("Score:", GlobalScore.score)

			
		if GlobalScore.bank_Level >= 20 && GlobalScore.bank_Level <= 100:
			#copper bumper disappears and gold bumper appears
			GlobalScore.score += 100
			print(GlobalScore.bank_Level)
			#print("Score:", GlobalScore.score)

			
		if GlobalScore.bank_Level >= 100:
			#gold bumper disappears and diamond bumper appears
			GlobalScore.score += 1000
			print(GlobalScore.bank_Level)
			#print("Score:", GlobalScore.score)

