extends CharacterBody3D


@onready var resum = $Resume
@onready var animetion = $AnimationPlayer
@onready var right =$Right
@onready var left = $Left
@onready var die_sound = $AudioStreamPlayer3
@onready var ch_poz = $AudioStreamPlayer4
@onready var die_menu = $MarginContainer
@onready var death = $Death
@onready var sound = $AudioStreamPlayer2
@onready var Jump_b = $Jump
const JUMP_VELOCITY = 23.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var set_revive = false
var set_revive_1 = false
var set_revive_2 = false
var buy_revive = false
var pl_dead = false

func _ready():
	buy_revive = SaveSystem.get_var("abcdefg123456h", buy_revive)
	pl_dead = false
	SaveSystem.set_var("abcdefg12345kl", pl_dead)

func _physics_process(delta):
	pl_dead = SaveSystem.get_var("abcdefg12345kl", pl_dead)
	if death.is_colliding():
		h_kill()
	elif pl_dead == true:
		h_kill()
	elif self.position.y < -10:
		h_kill()
	if self.position.z > 5:
		resum.show()
		get_tree().paused = true
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		animetion.play("Jump")
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("esc"):
		get_tree().paused = true
	move_and_slide()

func _on_jump_pressed():
	if is_on_floor():
		animetion.play("Jump")
		sound.play()
		velocity.y = JUMP_VELOCITY
	move_and_slide()

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://UI/ui.tscn")
	die_menu.hide()


#func _on_left_pressed():
	#position.z = -5
	#sound.play()


func _on_right_pressed():
	position.z = 5
	ch_poz.play()


func _on_zero_pressed():
	position.z = 0
	ch_poz.play()


func h_kill():
	die_sound.play()
	die_menu.show()
	get_tree().paused = true


func _on_resume_pressed():
	resum.hide()
	get_tree().paused = false
	position.z = 3



func _on_restart_pressed():
	pl_dead == false
	SaveSystem.set_var("abcdefg12345kl", pl_dead)
	die_menu.hide()
	Global.StartLevel()


func _on_revive_pressed():
	if buy_revive == true and Money.coin >= 25:
		pl_dead == false
		SaveSystem.set_var("abcdefg12345kl", pl_dead)
		set_revive = true
		SaveSystem.set_var("4bcdefg1234567", set_revive)
		set_revive_1 = true
		SaveSystem.set_var("5bcdefg1234567", set_revive_1)
		set_revive_2 = true
		SaveSystem.set_var("6bcdefg1234567", set_revive_2)
		Money.coin -= 25
		Money.save_coin()
		Global.StartLevel()
