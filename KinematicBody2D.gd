extends KinematicBody2D

const UP = Vector2(0,-1)#Needed for move_and_slide() because it is for a top up game function
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -550

var motion = Vector2()

# warning-ignore:unused_argument
func _physics_process(delta):#Shows warning in debugger, doesn't woork 
	#motion.y += 10
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		#motion.x = 100
		motion.x = SPEED
	
	elif Input.is_action_pressed("ui_left"):
		#motion.x = -100
		motion.x = SPEED
		
	else:
		
		 motion.x = 0
		
	if is_on_floor():#related to move_and_slide()
		#print("On floor.")
		if Input.is_action_just_pressed("ui_up"):
			#motion.y = -400
			motion.y = JUMP_HEIGHT
		#updates the movement for moution.y is updated after we hit the floor
	motion = move_and_slide(motion, UP)#Tells mo which was is up
	#print(motion)
	pass
