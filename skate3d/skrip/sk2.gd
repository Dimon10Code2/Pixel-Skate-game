extends KinematicBody

var speed = 0.5
var jumpForce = 30
var gravity = 50
onready var time = 0
onready var time_1 = 0
onready var time_2 = 0

var vel = Vector3()


func _physics_process(delta):
	if Input.is_action_pressed("player_right"):
		self.set_rotation_degrees(Vector3(5, 0, 0))
		time_1 += 1
		if time_1 > 3:
			self.set_rotation_degrees(Vector3(10, 0, 0))
			if time_1 > 6:
				self.set_rotation_degrees(Vector3(15, 0, 0))
				if time_1 > 9:
					self.set_rotation_degrees(Vector3(20, 0, 0))
	elif Input.is_action_pressed("player_left"):
		self.set_rotation_degrees(Vector3(-5, 0, 0))
		time_1 += 1
		if time_1 > 3:
			self.set_rotation_degrees(Vector3(-10, 0, 0))
			if time_1 > 6:
				self.set_rotation_degrees(Vector3(-15, 0, 0))
				if time_1 > 9:
					self.set_rotation_degrees(Vector3(-20, 0, 0))
	else:
		self.set_rotation_degrees(Vector3(0, 0, 0))
		time_1 = 0
	
	vel.y -= gravity * delta
	
	if Input.is_action_pressed("player_jump") and is_on_floor():
		vel.y += jumpForce
	#elif Input.is_action_pressed("player_jump"):
		#get_node("CollisionPolygon").set_disabled(true)
	#elif Input.is_action_pressed("player_far"):
		#vel.y -= farForce
		#get_node("CollisionPolygon").set_disabled(true)
	#else:
		#get_node("CollisionPolygon").set_disabled(false)
	
	vel = move_and_slide(vel, Vector3.UP)


