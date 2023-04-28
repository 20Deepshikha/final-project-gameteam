extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player : Node2D
var score : int

# Called when the node enters the scene tree for the first time.
func _ready():
	# Find the player node in the scene tree
	player = get_node("Player")
	
	# Set the starting score
	score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#     pass

func _on_HUD_start_game():
	# Start the game by setting the player's position and resetting the score
	player.position = Vector2(0, 0)
	score = 0
	
	# Hide the HUD and show the game over screen
	get_node("HUD").hide()
	get_node("GameOverScreen").hide()

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
	
