extends Control


@onready var menu_1 = $MarginContainer
@onready var menu_2 = $MarginContainer2
@onready var menu_3 = $MarginContainer3
@onready var menu_4 = $MarginContainer4


func _ready():
	get_tree().paused = false
	
	
	


func _on_volume_on_pressed():
	AudioServer.set_bus_volume_db(0, 0)


func _on_volume_off_pressed():
	AudioServer.set_bus_volume_db(0, -80)


func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, linear_to_db(value))


func _on_back_pressed():
	get_tree().change_scene_to_file("res://UI/ui.tscn")


func _on_creators_pressed():
	menu_1.hide()
	menu_2.show()


func _on_back_2_pressed():
	menu_2.hide()
	menu_1.show()


func _on_back_3_pressed():
	menu_3.hide()
	menu_1.show()


func _on_volume_options_pressed():
	menu_1.hide()
	menu_3.show()




func _on_resolusion_normal_pressed():
	texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR


func _on_resolusion_low_pressed():
	texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST


func _on_back_4_pressed():
	menu_4.hide()
	menu_1.show()


func _on_resolution_pressed():
	menu_1.hide()
	menu_4.show()
