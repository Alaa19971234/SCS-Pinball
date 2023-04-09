extends RigidBody3D

var gate
var gate_rigid

func _ready():
	gate = get_node("/root/PinballMap/Gate")
	gate_rigid = gate.get_node("RigidBody3D")

func _on_some_other_node_body_entered(body):
	if body.is_in_group("Ball"):
		print("done")
		# Apply a force to open the gate
		var force = Vector3(0, 0, -1) * 1000
		gate_rigid.apply_central_impulse(force)
