extends Control

@onready var ghost_menu = $MarginContainer6
@onready var buy_menu = $MarginContainer5
@onready var coin_lb = $coin
@onready var man_menu = $MarginContainer3
@onready var al_menu = $MarginContainer4
@onready var main_menu = $MarginContainer
@onready var Chapert_menu = $MarginContainer2
var al_buy = false
var mars_buy = false
var ghost_buy = false
var Cemetery_buy = false

func _ready():
	al_buy = SaveSystem.get_var("abcdefg123456g", al_buy)
	mars_buy = SaveSystem.get_var("abcdefg123456r", mars_buy)
	ghost_buy = SaveSystem.get_var("abcdefg123456d", ghost_buy)
	Cemetery_buy = SaveSystem.get_var("abcdefg123456s", Cemetery_buy)
	Money.load_coin()
	coin_lb.text = str('Coin:', Money.coin)
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
	if al_buy == true:
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
	if mars_buy == true: 
		Global.Level = load("res://sien/game_2.tscn")
		Global.StartLevel()
	#get_tree().change_scene_to_file("res://sien/game_3.tscn")


func _on_city_2_pressed():
	Global.Level = load("res://sien/game.tscn")
	Global.StartLevel()
	#get_tree().change_scene_to_file("res://sien/game_2.tscn")


func _on_mars_2_pressed():
	if mars_buy == true: 
		Global.Level = load("res://sien/game_2.tscn")
		Global.StartLevel()
	#get_tree().change_scene_to_file("res://sien/game_4.tscn")

func _on_back_2_pressed():
	Chapert_menu.show()
	al_menu.hide()

func _on_back_3_pressed():
	Chapert_menu.show()
	man_menu.hide()


func _on_buy_pressed():
	buy_menu.show()
	main_menu.hide()


func _on_buy_al_pressed():
	if al_buy == false and Money.coin >= 20:
		Money.coin -= 20
		Money.save_coin()
		coin_lb.text = str('Coin:', Money.coin)
		al_buy = true
		SaveSystem.set_var("abcdefg123456g", al_buy)


func _on_buy_mars_pressed():
	if mars_buy == false and Money.coin >= 10:
		Money.coin -= 10
		Money.save_coin()
		coin_lb.text = str('Coin:', Money.coin)
		mars_buy = true
		SaveSystem.set_var("abcdefg123456r", mars_buy)


func _on_bakc_5_pressed():
	buy_menu.hide()
	main_menu.show()


func _on_buy_ghost_pressed():
	if ghost_buy == false and Money.coin >= 30:
		Money.coin -= 30
		Money.save_coin()
		coin_lb.text = str('Coin:', Money.coin)
		ghost_buy = true
		SaveSystem.set_var("abcdefg123456d", ghost_buy)


func _on_buy_cemetery_pressed():
	if Cemetery_buy == false and Money.coin >= 20:
		Money.coin -= 20
		Money.save_coin()
		coin_lb.text = str('Coin:', Money.coin)
		Cemetery_buy = true
		SaveSystem.set_var("abcdefg123456s", Cemetery_buy)

func _on_ghost_pressed():
	if ghost_buy == true:
		Chapert_menu.hide()
		ghost_menu.show()
		Global.PlayerScene = load("res://Player/player_3.tscn")


func _on_cemetery_pressed():
	if Cemetery_buy == true:
		Global.Level = load("res://Map/game_3.tscn")
		Global.StartLevel()


func _on_cemetery_2_pressed():
	if Cemetery_buy == true:
		Global.Level = load("res://Map/game_3.tscn")
		Global.StartLevel()


func _on_city_3_pressed():
	Global.Level = load("res://sien/game.tscn")
	Global.StartLevel()


func _on_mars_3_pressed():
	if mars_buy == true: 
		Global.Level = load("res://sien/game_2.tscn")
		Global.StartLevel()


func _on_cemetery_3_pressed():
	if Cemetery_buy == true:
		Global.Level = load("res://Map/game_3.tscn")
		Global.StartLevel()


func _on_back_6_pressed():
	ghost_menu.hide()
	Chapert_menu.show()
