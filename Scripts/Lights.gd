extends StaticBody3D

var first_light1
var second_light1
var third_light1
var first_light2
var second_light2
var third_light2
var coin

func _ready():
	# Get references to the bumper meshes
	first_light1 = get_node("Lights/first_light1")
	second_light1 = get_node("Lights/second_light1")
	third_light1 = get_node("Lights/third_light1")
	first_light2 = get_node("Lights/first_light2")
	second_light2 = get_node("Lights/second_light2")
	third_light2 = get_node("Lights/third_light2")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if GlobalScore.score <= 100:
		#copper bumper
		first_light1.visible = true
		second_light1.visible = false
		third_light1.visible = false
		first_light2.visible = true
		second_light2.visible = false
		third_light2.visible = false
			
	if GlobalScore.score >= 100 && GlobalScore.score <= 1000:
		#copper bumper disappears and gold bumper appears
		first_light1.visible = false
		second_light1.visible = true
		third_light1.visible = false
		first_light2.visible = false
		second_light2.visible = true
		third_light2.visible = false
			
	if GlobalScore.score >= 1000 && GlobalScore.score <= 10000:
		#gold bumper disappears and diamond bumper appears
		first_light1.visible = false
		second_light1.visible = false
		third_light1.visible = true
		first_light2.visible = false
		second_light2.visible = false
		third_light2.visible = true
