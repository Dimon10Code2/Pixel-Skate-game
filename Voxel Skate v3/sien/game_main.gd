extends Node3D

@onready var sound = $AudioStreamPlayer2
@onready var start_map = $"map_spawn/start map"
@onready var money = $now_coin
@onready var max_record = $Max_Record
@onready var run_sound = $AudioStreamPlayer
@onready var stop = $Stop
@onready var mave = $Move
@onready var p_menu = $pause
@onready var menu = $MarginContainer
@onready var speed = $Speed
@onready var score = $Score
@onready var sprite = $Sprite3D
@onready var map_sp = $map_spawn
@onready var PlayerSpawn: Marker3D = $Pl_spawn
@onready var sky = $WorldEnvironment
var speed_map = 18
var segments = Global.level_file.segments
var start_seg = Global.level_file.start
var fon  = Global.level_file.background 
var sound_set = Global.level_file.sounds

var vel = Vector3()

var Player: CharacterBody3D = null

func _ready():
	Global.load_coin()
	
	
	if Global.level_file.id == '01':
		Global.load_max_score()
		if Global.set_revive == true:
			Global.load_score()
			score.text = str('Score:', Global.score_game)
			Global.set_revive = false
		elif Global.set_revive == false:
			Global.score_game = 0
			Global.save_score()
		update_rec()
	
	
	elif Global.level_file.id == '02':
		Global.load_max_score_1()
		if Global.set_revive == true:
			Global.load_score_1()
			score.text = str('Score:', Global.score_game_1)
			Global.set_revive = false
		elif Global.set_revive == false:
			Global.score_game_1 = 0
			Global.save_score_1()
		update_rec_1()
	
	
	elif Global.level_file.id == '03':
		Global.load_max_score_2()
		if Global.set_revive == true:
			Global.load_score_2()
			score.text = str('Score:', Global.score_game_2)
			Global.set_revive = false
		elif Global.set_revive == false:
			Global.score_game_2 = 0
			Global.save_score_2()
		update_rec_2()
	
	var sel_sound = sound_set[randi() % len(sound_set)]
	sound.stream = sel_sound
	sound.playing = true
	
	
	spawn_start(start_map)
	
	#sprite.texture = fon
	sky.environment.sky = Global.level_sky
	
	get_tree().paused = false
	randomize()
	spawn_inst(62, 0, 0)
	speed.text = str('speed:', speed_map)
	money.text = str('Coin:', Global.coin)
	Player = Global.PlayerScene.instantiate()
	Player.position = PlayerSpawn.position
	add_child(Player)
	
	
	
	
func _physics_process(delta):
	money.text = str('Coin:', Global.coin)
	for map in map_sp.get_children():
		map.position.x -= speed_map*delta
		if map.position.x < -62:
			spawn_inst(map.position.x+124, 0, 0)
			map.queue_free()
			if Global.level_file.id == '01':
				Global.score_game += 1
				score.text = str('Score:', Global.score_game)
				if Global.score_game > Global.max_score_game:
					Global.max_score_game = Global.score_game
					max_record.text = str('Max Score:', Global.max_score_game)
					Global.save_max_score()
			
			
			elif Global.level_file.id == '02':
				Global.score_game_1 += 1
				score.text = str('Score:', Global.score_game_1)
				if Global.score_game_1 > Global.max_score_game_1:
					Global.max_score_game_1 = Global.score_game_1
					max_record.text = str('Max Score:', Global.max_score_game_1)
					Global.save_max_score_1()
			
			
			
			elif Global.level_file.id == '03':
				Global.score_game_2 += 1
				score.text = str('Score:', Global.score_game_2)
				if Global.score_game_2 > Global.max_score_game_2:
					Global.max_score_game_2 = Global.score_game_2
					max_record.text = str('Max Score:', Global.max_score_game_2)
					Global.save_max_score_2()
	
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
func spawn_start(start_map):
	var insta = start_seg.instantiate()
	insta.position = start_map.position
	start_map.add_child(insta)

func resume():
	get_tree().paused = false
	menu.hide()
	p_menu.show()

func pause():
	Global.save_coin()
	get_tree().paused = true
	menu.show()
	p_menu.hide()
	

func update_rec():
	Global.load_max_score()
	max_record.text = str('Max Score:', Global.max_score_game)
func update_rec_1():
	Global.load_max_score_1()
	max_record.text = str('Max Score:', Global.max_score_game_1)
func update_rec_2():
	Global.load_max_score_2()
	max_record.text = str('Max Score:', Global.max_score_game_2)

func _on_resume_pressed():
	resume()
func _on_exit_pressed():
	get_tree().change_scene_to_file("res://UI/ui.tscn")
func _on_pause_pressed():
	pause()


func _on_move_pressed():
	Player.animetion.play("run")
	speed_map += 2
	speed.text = str('speed:', speed_map)
	run_sound.play()


func _on_stop_pressed():
	Player.animetion.play("stop")
	speed_map = 18
	speed.text = str('speed:', speed_map)
	run_sound.play()
