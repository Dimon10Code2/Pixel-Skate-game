extends Spatial

var speed_map = -25
var map_1 = preload("res://sen/map_group 1.tscn")
var vel = Vector3()


func _ready():
	randomize()
	spawn_inst(0, 0, 0)
	spawn_inst(0, 0, -525)
	
func _physics_process(delta):
	for map in $map_group_1.get_children():
		map.translation.z -= speed_map*delta
		if map.translation.z > 525:
			spawn_inst(0, 0, map.translation.z-525)
			map.queue_free()
			
	if Input.is_action_pressed("player_run"):
		speed_map -= 1.5
	elif Input.is_action_pressed("player_stop"):
		speed_map = -8

func spawn_inst(x, y, z):
	var inst = map_1.instance()
	inst.translation = Vector3(x, y, z)
	$map_group_1.add_child(inst)

func resume():
	get_tree().paused = false
	$MarginContainer.hide()
	$pause.show()

func pause():
	get_tree().paused = true
	$MarginContainer.show()
	$pause.hide()

func _on_resume_pressed():
	resume()
func _on_pause_pressed():
	pause()
	
	
	


func _on_quit_to_menu_pressed():
	get_tree().change_scene("res://sen/UI.tscn")




func _on_move_pressed():
	speed_map -= 1.5


func _on_stop_pressed():
	speed_map = -8
