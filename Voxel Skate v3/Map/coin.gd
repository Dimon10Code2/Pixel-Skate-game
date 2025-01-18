@tool
extends Node3D
@export_range(1, 50, 1) var coin_value = 1:
	set(value):
		if value != coin_value:
			coin_value = value
			if text_coin != null:
				text_coin.text = str(coin_value)
@onready var text_coin = $MeshInstance3D/valuee.mesh 
@onready var animator = $AnimationPlayer
#var coin= 0
#var max_coin = 0
func _ready():
	text_coin.text = str(coin_value) 
#func _process(delta):
	#load_coin()
#func  save_coin():
	#SaveSystem.set_var("abcdefg123456f", coin)
#func load_coin():
	#coin = SaveSystem.get_var("abcdefg123456f", coin)
func _on_area_3d_body_entered(body):
	if "JUMP_VELOCITY" in body:
		Global.coin = Global.coin + coin_value
		#load_coin()
		#coin = coin + coin_value
		#save_coin()
		animator.speed_scale = 2
		animator.play('destroy')
