extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var impulsion = 500
var dirx = 0
var clic = 0


func _ready():
	pass

func _input_event(viewport, event, shape_idx):
	if(event.type == InputEvent.MOUSE_BUTTON and event.button_index == 1 and event.is_pressed() and !event.is_echo()):
		dirx = rand_range(-400,400)
		apply_impulse(Vector2(0,0),Vector2(dirx,-impulsion))
		clic +=1
		