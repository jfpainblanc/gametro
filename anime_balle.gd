extends Node2D

# Member variables
var screen_size
var direction = Vector2(1.0, 1.0)

# Constant for ball speed (in pixels/second)
const INITIAL_BALL_SPEED = 200
# Speed of the ball (also in pixels/second)
var ball_speed = INITIAL_BALL_SPEED


func _ready():
	screen_size = get_viewport_rect().size
	set_process(true)
	pass
	
func _process(delta):
	var ball_pos = get_node("ball").get_pos()
	# Integrate new ball position
	ball_pos += direction * ball_speed * delta
	# Flip when touching roof or floor
	if ((ball_pos.y < 0 and direction.y < 0) or (ball_pos.y > screen_size.y and direction.y > 0)):
		direction.y = -direction.y
	if ((ball_pos.x < 0 and direction.x < 0) or (ball_pos.x > screen_size.x and direction.x > 0)):
		ball_pos.x = 0
		direction.y = randf()*2.0 - 2
		direction = direction.normalized()
		ball_speed *= 1.1
	get_node("ball").set_pos(ball_pos)
	
	

