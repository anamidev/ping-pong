extends StaticBody2D

var ball_pos : Vector2
var distance : int
var move_by : int
var win_height : int
var paddle_height : int

# Called when the node enters the scene tree for the first time.
func _ready():
	win_height = get_parent().texture.get_height()
	paddle_height = $ColorRect.get_size().y
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ball_pos = $"../Ball".position
	distance = position.y - ball_pos.y
	
	if abs(distance) > get_parent().PADDLE_SPEED * delta:
		move_by = get_parent().PADDLE_SPEED * delta * (distance / abs(distance))
	else:
		move_by = distance
	position.y -= move_by
	position.y = clamp(position.y, paddle_height / 2, win_height - (paddle_height / 2))
