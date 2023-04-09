extends DirectionalLight3D

var copper
var gold
var diamond

func _ready():
	# Get references to the bumper meshes
	NorthRedLight = get_node("Lights/NorthRedLight")
	NorthYellowLight = get_node("Lights/NorthYellowLight")
	NorthBlueLight = get_node("Lights/NorthBlueLight")
	SouthRedLight = get_node("Lights/SouthRedLight")
	SouthYellowLight = get_node("Lights/SouthYellowLight")
	SouthBlueLight = get_node("Lights/SouthBlueLight")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if GlobalScore.score <= 100:


		if GlobalScore.score >= 100 && GlobalScore.score <= 1000:


		if GlobalScore.score >= 1000 && GlobalScore.score <= 10000:
