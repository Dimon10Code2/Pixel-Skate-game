extends Control

func _on_play_pressed():
	get_tree().change_scene("res://sen/base.tscn")



func _on_quit_pressed():
	get_tree().quit()
