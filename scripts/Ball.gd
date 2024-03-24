extends CharacterBody2D

var win_size : Vector2
const START_SPEED : int = 500
const ACCEL : int = 50
const MAX_BOUNCE_ANGLE : float = 0.6
var speed : int
var direction : Vector2

func _ready():
	win_size = get_parent().texture.get_size()
	
func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		if collider == $"../Player" or collider == $"../AI":
			speed += ACCEL
			direction = calc_new_direction(collider)
		else:
			direction = direction.bounce(collision.get_normal())
				
	
func new_ball():
	position.x = win_size.x / 2
	position.y = randi_range(200, win_size.y - 200)
	speed = START_SPEED
	direction = random_direction()
	
func random_direction():
	var new_direction := Vector2()
	new_direction.x = [1, -1].pick_random()
	new_direction.y = randf_range(-1, 1)
	return new_direction.normalized()

func calc_new_direction(collider):
	var ball_y = position.y
	var paddle_y = collider.position.y
	var distance = ball_y - paddle_y
	var new_direction := Vector2()
	
	if direction.x > 0:
		new_direction.x = -1
	else:
		new_direction.x = 1
	new_direction.y = (distance / (collider.paddle_height / 2)) * MAX_BOUNCE_ANGLE
	return new_direction.normalized()
