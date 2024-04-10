extends MeshInstance3D

var pl_dead = false

func _ready():
	pass 


func _process(delta):
	pass


func _on_static_body_3d_body_entered(body):
	if "JUMP_VELOCITY" in body:
		pl_dead = true
		SaveSystem.set_var("abcdefg12345kl", pl_dead)
