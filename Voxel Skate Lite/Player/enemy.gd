extends MeshInstance3D


@onready var kill = $kill
@onready var minus = $AudioStreamPlayer2
@onready var minus_1 = $dead1
@onready var minus_2 = $dead2
@onready var kill_1 = $AudioStreamPlayer

var sk = 0

func _ready():
	pass 

func _process(delta):
	if kill.is_colliding():
		sk += 1
		kill_1.play()
	elif minus_1.is_colliding() or minus_2.is_colliding():
		sk -= 1
		minus.play()
