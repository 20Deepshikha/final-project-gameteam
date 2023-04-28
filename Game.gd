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
	DeathCount = 0
	get_tree().call_group("mobs", "queue_free")
	$Music.play()
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$HUD/HighScore.hide()
