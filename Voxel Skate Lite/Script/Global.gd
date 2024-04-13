extends Node

var PlayerScene: PackedScene
var Level: PackedScene
var coin = 0
var score_game = 0
var max_score_game = 0
var score_game_1 = 0
var max_score_game_1 = 0
var score_game_2 = 0
var max_score_game_2 = 0
var pl_dead = false
var set_revive = false
var level_file = []
var load_st = true
func StartLevel():
	if Level != null:
		get_tree().change_scene_to_packed(Level)
		
func save_coin():
	SaveSystem.set_var("abcdefg123456f", coin)
func load_coin():
	coin = SaveSystem.get_var("abcdefg123456f", coin)
func save_score():
	SaveSystem.set_var("1bcdefg1234567", score_game)
func load_score():
	score_game = SaveSystem.get_var("1bcdefg1234567", score_game)
func save_max_score():
	SaveSystem.set_var( "abcdefg1234567", max_score_game)
func load_max_score():
	max_score_game = SaveSystem.get_var("abcdefg1234567", max_score_game)



func save_score_1():
	SaveSystem.set_var("2bcdefg1234567", score_game_1)
func load_score_1():
	score_game_1 = SaveSystem.get_var("2bcdefg1234567", score_game_1)
func save_max_score_1():
	SaveSystem.set_var( "abcdefg1234568", max_score_game_1)
func load_max_score_1():
	max_score_game_1 = SaveSystem.get_var("abcdefg1234568", max_score_game_1)


func save_score_2():
	SaveSystem.set_var("3bcdefg1234567", score_game_2)
func load_score_2():
	score_game_2 = SaveSystem.get_var("3bcdefg1234567", score_game_2)
func save_max_score_2():
	SaveSystem.set_var( "abcdefg1234569", max_score_game_2)
func load_max_score_2():
	max_score_game_2 = SaveSystem.get_var("abcdefg1234569", max_score_game_2)


func  save_all_stats():
	save_coin()
	save_score()
	save_score_1()
	save_score_2()
	

func save_load_st():
	SaveSystem.set_var("gfbcdefg1234567", load_st)
	
	
	
	
func load_load_st():
	load_st = SaveSystem.get_var("gfbcdefg1234567", load_st)
	
	
	
	
	
