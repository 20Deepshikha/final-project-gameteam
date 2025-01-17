extends CanvasLayer
signal start_game


var coins = 0

#func _ready():
	#$coins.text = String(coins)
	
func _physics_process(delta):
	if coins == 3:
		get_tree().change_scene("res://Game.tscn")

func _on_coin_collected():
	coins = coins + 1
	_ready()



func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	yield($MessageTimer, "timeout")

	$Message.text = "Drift Legends!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)
func update_Highscore(Highscore):
	$HighScore.text = "HighScore\n" + str(Highscore)
	
func _on_StartButton_pressed():
	$StartButton.hide()
	$Message.hide()
	$Instructions.hide()
	emit_signal("start_game")
	
func _on_MessageTimer_timeout():
	$Message.hide()
