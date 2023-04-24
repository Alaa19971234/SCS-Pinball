extends StaticBody3D

var first_light1
var second_light1
var third_light1
var first_light2
var second_light2
var third_light2
var coin
var OptionSelectionSound: AudioStreamPlayer3D
var bank_level

func _ready():
	# Get references to the bumper meshes
	OptionSelectionSound = get_node("OptionSelectionSound") as AudioStreamPlayer3D
	OptionSelectionSound.play()
	first_light1 = get_node("Lights/first_light1")
	second_light1 = get_node("Lights/second_light1")
	third_light1 = get_node("Lights/third_light1")
	first_light2 = get_node("Lights/first_light2")
	second_light2 = get_node("Lights/second_light2")
	third_light2 = get_node("Lights/third_light2")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if GlobalScore.bank_Level <= 20:
		#copper bumper
		first_light1.visible = true
		second_light1.visible = false
		third_light1.visible = false
		first_light2.visible = true
		second_light2.visible = false
		third_light2.visible = false
			
	if GlobalScore.bank_Level >= 20 && GlobalScore.bank_Level <= 100:
		#copper bumper disappears and gold bumper appears
		first_light1.visible = false
		second_light1.visible = true
		third_light1.visible = false
		first_light2.visible = false
		second_light2.visible = true
		third_light2.visible = false
			
	if GlobalScore.bank_Level >= 100:
		#gold bumper disappears and diamond bumper appears
		first_light1.visible = false
		second_light1.visible = false
		third_light1.visible = true
		first_light2.visible = false
		second_light2.visible = false
		third_light2.visible = true
