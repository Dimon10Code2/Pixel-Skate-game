extends Control
@onready var LoadBar = $ProgressBar
var time = 0

func _ready():
	LoadBar.value = 1


func _process(delta):
	time += 1
	LoadBar.value += 1
	if time > 90:
		Global.StartLevel()

