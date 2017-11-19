extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var ball
var score
var totalS = 0
var currentS = 0
var impulsion = 500



func _ready():
	ball = get_node("ball")
	score = get_node("score")
	var totalS = 0
	var currentS = 0
	
	var text = "Total Score: "+str(totalS)+" \n"+"Current Score: "+str(currentS)
	score.set_text(text)
	
	ball.set_max_contacts_reported(4)
	ball.set_contact_monitor(true)
	self.set_process_input(true)
	self.set_process(true)
	pass

func incScore():
	if currentS > totalS :
		totalS = currentS
	setScore(currentS, totalS)


func setScore(var c, var t):
	var text = "Total Score: "+str(t)+" \n"+"Current Score: "+str(c)
	score.set_text(text)

func _process(delta):
		var list=ball.get_colliding_bodies()
		
		if not list.empty():
			print(list[0])
			if str(list[0]) == "[StaticBody2D:564]":
				print("touche sol")
				ball.clic = 0
				currentS = 0
		currentS= ball.clic
		incScore()

func _input(event):
	if event.is_action_pressed("ui_up"):
		ball.apply_impulse(Vector2(0,0),Vector2(0,-impulsion))
		incScore()
	if event.is_action_pressed("ui_left"):
		ball.apply_impulse(Vector2(0,0),Vector2((-impulsion)/2,-impulsion))
		incScore()
	if event.is_action_pressed("ui_right"):
		ball.apply_impulse(Vector2(0,0),Vector2(impulsion/2,-impulsion))
		incScore()
		