extends Control

@onready var man_menu = $MarginContainer3
@onready var al_menu = $MarginContainer4
@onready var main_menu = $MarginContainer
@onready var Chapert_menu = $MarginContainer2


func _ready():
	get_tree().paused = false



func _on_play_pressed():
	main_menu.hide()
	Chapert_menu.show()


func _on_options_pressed():
	get_tree().change_scene_to_file("res://Options/options.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_man_pressed():
	Chapert_menu.hide()
	man_menu.show()
	Global.PlayerScene = load("res://Player/player.tscn")

func _on_alien_pressed():
	Chapert_menu.hide()
	al_menu.show()
	Global.PlayerScene = load("res://Player/player_2.tscn")

func _on_back_pressed():
	main_menu.show()
	Chapert_menu.hide()



func _on_city_pressed():
	Global.Level = load("res://sien/game.tscn")
	Global.StartLevel()
	#get_tree().change_scene_to_file()


func _on_mars_pressed():
	Global.Level = load("res://sien/game_2.tscn")
	Global.StartLevel()
	#get_tree().change_scene_to_file("res://sien/game_3.tscn")


func _on_city_2_pressed():
	Global.Level = load("res://sien/game.tscn")
	Global.StartLevel()
	#get_tree().change_scene_to_file("res://sien/game_2.tscn")


func _on_mars_2_pressed():
	Global.Level = load("res://sien/game_2.tscn")
	Global.StartLevel()
	#get_tree().change_scene_to_file("res://sien/game_4.tscn")

func _on_back_2_pressed():
	Chapert_menu.show()
	al_menu.hide()

func _on_back_3_pressed():
	Chapert_menu.show()
	man_menu.hide()
