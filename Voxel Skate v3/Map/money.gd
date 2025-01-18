extends Node3D

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var get_coin: RayCast3D = $RayCast3D
var coin= 0
var max_coin = 0



func _ready():
	#load_max_coin()
	anim.play('up_anim')

func _process(_delta):
	load_coin()
	if get_coin.is_colliding():
		coin += 1
		save_coin()
		#save_max_coin()
		$'.'.queue_free()
func  save_coin():
	SaveSystem.set_var("abcdefg123456f", coin)
func load_coin():
	coin = SaveSystem.get_var("abcdefg123456f", coin)
#func load_max_coin():
	#max_coin = SaveSystem.get_var("abcdefg123456r", coin)
#func save_max_coin():
	#if coin > max_coin:
		#SaveSystem.set_var("abcdefg123456f", coin)
	#else:
		#max_coin = SaveSystem.get_var("abcdefg123456r", coin)
