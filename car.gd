extends KinematicBody2D
signal touch_the_wall

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



func when_touches_side_of_road(body: PhysicsBody2D) -> void:
	print(body.name)
	if body.name == "car":
		# Stop the car's velocity
		velocity = Vector2.ZERO
	emit_signal("touch_the_wall")


func on_car_reaches_end(body: PhysicsBody2D) -> void:
	print(body.name)
	if body.name == "car":
		var new_position = Vector2(body.global_position.x, 400) # Change this to your desired position
		body.set_global_position(new_position)
