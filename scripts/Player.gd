extends StaticBody2D
var win_height : int
var paddle_height : int

func _ready():
	win_height = get_parent().texture.get_height() 
	paddle_height = $ColorRect.get_size().y

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui_down"):
		position.y += get_parent().PADDLE_SPEED * delta
	
	position.y = clamp(position.y, paddle_height / 2, win_height - (paddle_height / 2))
