extends Sprite2D

@onready var menu = $PauseMenu

const PADDLE_SPEED : int = 800
var score := [0,0] # 0:Player, 1:AI
var is_paused = false

func _on_ball_timer_timeout():
	$Ball.new_ball()

func _on_score_left_body_entered(_body):
	score[1] += 1
	$"HUD/AIScore".text = str(score[1])
	$"BallTimer".start()
	
func _on_score_right_body_entered(_body):
	score[0] += 1
	$"HUD/PlayerScore".text = str(score[0])
	$"BallTimer".start()
	
func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		pause_menu()
		
func pause_menu():
	if is_paused:
		menu.hide()
		Engine.time_scale = 1
	else:
		menu.show()
		Engine.time_scale = 0
	is_paused = !is_paused
