extends KinematicBody

var current_angle = Vector3();
var target_rotation = Vector3();
export var speed = 3.0;

func _process(delta):
	rotation_degrees = Vector3(0,lerp(rotation_degrees.y,target_rotation.y,speed*delta),0)

func _on_RightButton_pressed():
	target_rotation = target_rotation -  Vector3(0,90,0)

func _on_LeftButton_pressed():
	target_rotation = target_rotation +  Vector3(0,90,0)
