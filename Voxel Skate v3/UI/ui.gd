extends Control

@onready var purchased_4 = $MarginContainer5/VBoxContainer/Label5
@onready var purchased_3 = $MarginContainer5/VBoxContainer/Label4
@onready var purchased_2 = $MarginContainer5/VBoxContainer/Label3
@onready var purchased_1 = $MarginContainer5/VBoxContainer/Label2
@onready var purchased = $MarginContainer5/VBoxContainer/Label
@onready var buy_menu = $MarginContainer5
@onready var coin_lb = $coin
@onready var map_menu = $MarginContainer3
@onready var main_menu = $MarginContainer
@onready var Chapert_menu = $MarginContainer2
var al_buy = false
var mars_buy = false
var ghost_buy = false
var Cemetery_buy = false
var buy_revive = false
var cemet:Map_Preset
var mars:Map_Preset 
var city:Map_Preset
var city_sky
var mars_sky
var cementery_sky


func _ready():
	city = load("res://resource/City.tres")
	mars = load("res://resource/Mars.tres")
	cemet = load("res://resource/Cemetery.tres")
	city_sky = load("res://resource/cite_sky.tres")
	mars_sky = load("res://resource/sky_mars.tres")
	cementery_sky = load("res://resource/cementery_sky.tres")
	al_buy = SaveSystem.get_var("abcdefg123456g", al_buy)
	mars_buy = SaveSystem.get_var("abcdefg123456r", mars_buy)
	ghost_buy = SaveSystem.get_var("abcdefg123456d", ghost_buy)
	Cemetery_buy = SaveSystem.get_var("abcdefg123456s", Cemetery_buy)
	buy_revive = SaveSystem.get_var("abcdefg123456h", buy_revive)
	Global.load_load_st()
	Global.load_coin()
	coin_lb.text = str('Coin:', Global.coin)
	if al_buy == true:
		purchased.show()
	if mars_buy == true:
		purchased_1.show()
	if ghost_buy == true:
		purchased_2.show()
	if Cemetery_buy == true:
		purchased_3.show()
	if buy_revive == true:
		purchased_4.show()
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
	map_menu.show()
	Global.PlayerScene = load("res://Player/player.tscn")

func _on_alien_pressed():
	if al_buy == true:
		Chapert_menu.hide()
		map_menu.show()
		Global.PlayerScene = load("res://Player/player_2.tscn")

func _on_back_pressed():
	main_menu.show()
	Chapert_menu.hide()



func _on_city_pressed():
	Global.level_file = city
	Global.level_sky = city_sky
	Global.Level = load("res://sien/game_main.tscn")
	if Global.load_st == true:
		get_tree().change_scene_to_file("res://sien/loading_memu.tscn")
	elif Global.load_st == false:
		Global.StartLevel()
	
	
	#Global.Level = load("res://sien/game.tscn")
	#get_tree().change_scene_to_file()


func _on_mars_pressed():
	if mars_buy == true: 
		Global.level_file = mars
		Global.level_sky = mars_sky
		Global.Level = load("res://sien/game_main.tscn")
		if Global.load_st == true:
			get_tree().change_scene_to_file("res://sien/loading_memu.tscn")
		elif Global.load_st == false:
			Global.StartLevel()

func _on_back_3_pressed():
	Chapert_menu.show()
	map_menu.hide()


func _on_buy_pressed():
	buy_menu.show()
	main_menu.hide()


func _on_buy_al_pressed():
	if al_buy == false and Global.coin >= 35:
		Global.coin -= 35
		Global.save_coin()
		coin_lb.text = str('Coin:', Global.coin)
		al_buy = true
		SaveSystem.set_var("abcdefg123456g", al_buy)
		purchased.show()


func _on_buy_mars_pressed():
	if mars_buy == false and Global.coin >= 15:
		Global.coin -= 15
		Global.save_coin()
		coin_lb.text = str('Coin:', Global.coin)
		mars_buy = true
		SaveSystem.set_var("abcdefg123456r", mars_buy)
		purchased_1.show()


func _on_bakc_5_pressed():
	buy_menu.hide()
	main_menu.show()


func _on_buy_ghost_pressed():
	if ghost_buy == false and Global.coin >= 50:
		Global.coin -= 50
		Global.save_coin()
		coin_lb.text = str('Coin:', Global.coin)
		ghost_buy = true
		SaveSystem.set_var("abcdefg123456d", ghost_buy)
		purchased_2.show()


func _on_buy_cemetery_pressed():
	if Cemetery_buy == false and Global.coin >= 40:
		Global.coin -= 40
		Global.save_coin()
		coin_lb.text = str('Coin:', Global.coin)
		Cemetery_buy = true
		SaveSystem.set_var("abcdefg123456s", Cemetery_buy)
		purchased_3.show()

func _on_ghost_pressed():
	if ghost_buy == true:
		Chapert_menu.hide()
		map_menu.show()
		Global.PlayerScene = load("res://Player/player_3.tscn")


func _on_cemetery_pressed():
	if Cemetery_buy == true:
		Global.level_file = cemet
		Global.level_sky = cementery_sky
		Global.Level = load("res://sien/game_main.tscn")
		if Global.load_st == true:
			get_tree().change_scene_to_file("res://sien/loading_memu.tscn")
		elif Global.load_st == false:
			Global.StartLevel()


func _on_buy_revive_pressed():
	if buy_revive == false and Global.coin >= 50:
		Global.coin -= 50
		Global.save_coin()
		coin_lb.text = str('Coin:', Global.coin)
		buy_revive = true
		SaveSystem.set_var("abcdefg123456h", buy_revive)
		purchased_4.show()
