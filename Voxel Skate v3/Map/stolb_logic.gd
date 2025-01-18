extends MeshInstance3D


func _ready():
	pass 


func _process(delta):
	pass


func _on_static_body_3d_body_entered(body):
	if "JUMP_VELOCITY" in body:
		Global.pl_dead = true
		
