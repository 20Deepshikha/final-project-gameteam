extends KinematicBody2D


var accel = 5000
var max_speed = 100000
var turbo_speed = 1000000
var turbo_accel = 10000
var friction = 2500
var deaccel = 10000
const ROTATION_SPEED = 0.4

var velocity = Vector2.ZERO
onready var car = $AnimatedSprite

func _ready():
	pass

func _process(delta):
	#speed and break
	if(Input.is_action_pressed("ui_up")):
		velocity.y = move_toward(velocity.y, -turbo_speed, turbo_accel * delta)
	elif(Input.is_action_pressed("ui_up")):
		velocity.y = move_toward(velocity.y, -max_speed, accel * delta)
	elif(Input.is_action_pressed("ui_down")):
		velocity.y = move_toward(velocity.y, 0, deaccel * delta)
	else:
		velocity.y = move_toward(velocity.y, 0, friction * delta)
	
	# Rotation of car
	if Input.is_action_pressed("ui_left"):
		rotation -= ROTATION_SPEED * delta
	elif(Input.is_action_pressed("ui_right")):
		rotation += ROTATION_SPEED * delta
		
	var motion = velocity * delta
	move_and_slide(motion)
