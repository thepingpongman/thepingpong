extends Node2D

var PlayerScore = 0
var OpponentScore = 0

func _ready():
	$Ball2.position = Vector2(640,360)
	$Player.position = Vector2(30,360)
	$NPC.position = Vector2(1250,360)
	
func _on_Left_body_entered(body):
	score_achieved()
	OpponentScore += 1

func _on_Right_body_entered(body):
	score_achieved()
	PlayerScore += 1
	
func _process(delta):
	$CanvasLayer/PlayerScore.text = str(PlayerScore)
	$CanvasLayer/OpponentScore.text = str(OpponentScore)
	$CanvasLayer/CountdownLabel.text = str(int($CountdownTimer.time_left) + 1)

func _on_CountdownTimer_timeout():
	get_tree().call_group('BallGroup', 'restart_ball')
	$CanvasLayer/CountdownLabel.visible = false
	
func score_achieved():
	$Ball2.position = Vector2(640,360)
	get_tree().call_group('BallGroup', 'stop_ball')
	$CountdownTimer.start()
	$CanvasLayer/CountdownLabel.visible = true
	$Player.position.x = 35
	$NPC.position.x = 1280 - 35


