extends StaticBody3D

var collisionShapeEnabled = false

func _ready():
	# disable the collision shape by default
	get_node("CollisionShape3D").disabled = true

func _input(event):
	# enable the collision shape when the button is pressed
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		get_node("CollisionShape3D").disabled = false
	# disable the collision shape when the button is released
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and !event.is_pressed():
		get_node("CollisionShape3D").disabled = true



