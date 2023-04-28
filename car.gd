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
	if Input.is_action_pressed("ui_up"):
		velocity = velocity.move_toward(Vector2(0, -max_speed).rotated(rotation), accel * delta)
	elif velocity.length_squared() > 0:
		velocity = velocity.move_toward(Vector2.ZERO, deaccel * delta)
	else:
		velocity = Vector2.ZERO
		
	# Rotation of car
	if Input.is_action_pressed("ui_left"):
		rotation -= ROTATION_SPEED * delta
	elif Input.is_action_pressed("ui_right"):
		rotation += ROTATION_SPEED * delta
	
	var motion = velocity * delta
	move_and_slide(motion)
