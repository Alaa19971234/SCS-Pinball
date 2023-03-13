extends StaticBody3D

func _input(event):
	# disable the collision shape when the "F" key is pressed
	if event is InputEventKey and event.keycode == KEY_F and event.is_pressed():
		get_node("CollisionShape3D").disabled = true
	# enable the collision shape when the "F" key is released
	elif event is InputEventKey and event.keycode == KEY_F and !event.is_pressed():
		get_node("CollisionShape3D").disabled = false

