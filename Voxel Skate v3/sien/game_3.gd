extends Node3D

@onready var anim = $Player/AnimationPlayer
@onready var max_record = $Max_Record
@onready var max_score_game = 0
@onready var run_sound = $AudioStreamPlayer
@onready var stop = $Stop
@onready var mave = $Move
@onready var p_menu = $pause
@onready var menu = $MarginContainer
@onready var speed = $Speed
@onready var score = $Score
@onready var sprite = $Sprite3D
@onready var map_sp = $map_spawn
var score_game = 0 
var speed_map = 18
var segments = [
	preload("res://Map/map_k.tscn"),
	preload("res://Map/map_l.tscn"),
	preload("res://Map/map_p.tscn"),
	preload("res://Map/map_s.tscn")
]
var fon  = preload("res://fone/kandinsky-download-1710175667344.png")

var vel = Vector3()


func _ready():
	update_rec()
	get_tree().paused = false
	randomize()
	spawn_inst(62, 0, 0)
	speed.text = str('speed:', speed_map)
	
func _physics_process(delta):
	for map in map_sp.get_children():
		map.position.x -= speed_map*delta
		if map.position.x < -62:
			spawn_inst(map.position.x+124, 0, 0)
			map.queue_free()
			score_game += 1
			score.text = str('Score:', score_game)
			if score_game>max_score_game:
				max_score_game = score_game
				SaveSystem.set_var( "abcdefg1234567", max_score_game)
			else:
				max_score_game = SaveSystem.get_var("abcdefg1234567", max_score_game)
			update_rec()
	for fone in sprite.get_children():
		fone.position.x -= speed_map*delta
	if Input.is_action_pressed("player_run"):
		speed_map += 2
		speed.text = str('speed:', speed_map)
		run_sound.play()
	elif Input.is_action_pressed("player_stop"):
		speed_map = 18
		speed.text = str('speed:', speed_map)
		run_sound.play()
func spawn_inst(x, y, z):
	var inst = segments[randi() % len(segments)].instantiate()
	inst.position = Vector3(x, y, z)
	map_sp.add_child(inst)

func resume():
	get_tree().paused = false
	menu.hide()
	p_menu.show()

func pause():
	get_tree().paused = true
	menu.show()
	p_menu.hide()
	

func update_rec():
	max_score_game = SaveSystem.get_var("abcdefg1234567", max_score_game)
	max_record.text = str('Max Score:', max_score_game)

func _on_resume_pressed():
	resume()
func _on_exit_pressed():
	get_tree().change_scene_to_file("res://UI/ui.tscn")
func _on_pause_pressed():
	pause()


func _on_move_pressed():
	anim.play("run")
	speed_map += 2
	speed.text = str('speed:', speed_map)
	run_sound.play()


func _on_stop_pressed():
	anim.play("stop")
	speed_map = 18
	speed.text = str('speed:', speed_map)
	run_sound.play()
