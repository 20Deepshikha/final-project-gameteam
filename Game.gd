extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func new_game():
	$StaticBody2D.show()
	$StaticBody2D/Heart1.show()
	$StaticBody2D/Heart2.show()
	$StaticBody2D/Heart3.show()
	#DeathCount = 0
	get_tree().call_group("mobs", "queue_free")
	$Music.play()
	#score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	#$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$HUD/HighScore.hide()
# func _process(delta):
#     pass

func _on_HUD_start_game():
	# Start the game by setting the player's position and resetting the score
	$car.position = Vector2(230, 700)
	score = 0
	
	# Hide the HUD and show the game over screen
	get_node("HUD/Message").hide()
	get_node("HUD/Instructions").hide()
	#get_node("GameOverScreen").hide()

func add_score(points : int):
	# Add the specified number of points to the score
	score += points
	
	# Update the score label in the HUD
	get_node("HUD/ScoreLabel").text = "Score: " + str(score)

func game_over():
	# Show the game over screen and the final score
	get_node("GameOverScreen/ScoreLabel").text = "Final Score: " + str(score)
	get_node("GameOverScreen").show()

	# Pause the game and disable the player's movement
	get_tree().paused = true
	player.get_node("Movement").set_process(false)
	


func _on_Scoretimer_timeout():
	score += 1
	get_node("HUD/ScoreLabel").text = str(score)
	


func _on_car_touch_the_wall():
	score -= 5
	get_node("HUD/ScoreLabel").text = str(score)
