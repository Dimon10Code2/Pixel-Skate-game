extends Node

var PlayerScene: PackedScene
var Level: PackedScene


func StartLevel():
	if Level != null:
		get_tree().change_scene_to_packed(Level)
		
