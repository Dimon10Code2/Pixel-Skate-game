extends Node3D

@onready var money = $now_coin
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
@onready var PlayerSpawn: Marker3D = $Pl_spawn
var set_revive = false
var score_game = 0 
var speed_map = 18
var buy_revive = false
var segments = [
	preload("res://Map/map_a.tscn"),
	preload("res://Map/map_b.tscn"),
	preload("res://Map/map_c.tscn"),
	preload("res://Map/map_d.tscn"),
	preload("res://Map/map_e.tscn")
	#preload("res://Map/map_f.tscn"),
	#preload("res://Map/map_j.tscn")
]
var fon  = preload("res://fone/IMG_20240226_175955_014.jpg")

var vel = Vector3()

var Player: CharacterBody3D = null

func _ready():
	set_revive = SaveSystem.get_var("4bcdefg1234567", set_revive)
	buy_revive = SaveSystem.get_var("abcdefg123456h", buy_revive)
	if set_revive == true:
		score_game = SaveSystem.get_var("1bcdefg1234567", score_game)
		score.text = str('Score:', score_game)
		set_revive = false
		SaveSystem.set_var("4bcdefg1234567", set_revive)
	update_rec()
	get_tree().paused = false
	randomize()
	spawn_inst(62, 0, 0)
	speed.text = str('speed:', speed_map)
	money.text = str('Coin:', Money.coin)
	Player = Global.PlayerScene.instantiate()
	Player.position = PlayerSpawn.position
	add_child(Player)
	
	
	
	
func _physics_process(delta):
	money.text = str('Coin:', Money.coin)
	for map in map_sp.get_children():
		map.position.x -= speed_map*delta
		if map.position.x < -62:
			spawn_inst(map.position.x+124, 0, 0)
			map.queue_free()
			score_game += 1
			score.text = str('Score:', score_game)
			SaveSystem.set_var("1bcdefg1234567", score_game)
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
	Player.animetion.play("run")
	speed_map += 2
	speed.text = str('speed:', speed_map)
	run_sound.play()


func _on_stop_pressed():
	Player.animetion.play("stop")
	speed_map = 18
	speed.text = str('speed:', speed_map)
	run_sound.play()

func _on_revive_pressed():
	if buy_revive == true and Money.coin >= 25:
		set_revive = true
		SaveSystem.set_var("4bcdefg1234567", set_revive)
		Money.coin -= 25
		Money.save_coin()
		Global.StartLevel()
