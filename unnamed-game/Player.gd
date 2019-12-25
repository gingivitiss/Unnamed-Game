extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()
const UP = Vector2(0,-1)

const ACCELERATION = 200
const MAXSPEED = 600
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	_movement()
	
func _movement():
	if Input.is_action_just_pressed("ui_left"):
		
		velocity.x = max(velocity.x-ACCELERATION,-MAXSPEED)

	elif Input.is_action_just_pressed("ui_right"):
		velocity.x = min(velocity.x+ACCELERATION,MAXSPEED)
		print(velocity.x)
	
	elif Input.is_action_pressed("ui_down"):
		velocity.y = min(velocity.y+ACCELERATION,MAXSPEED)
	elif Input.is_action_pressed("ui_up"):
		velocity.y = max(velocity.y-ACCELERATION,-MAXSPEED)
#		
	else:
		velocity.x = lerp(velocity.x,0,0.01)
		velocity.y = lerp(velocity.y,0,0.03)
	if velocity.length() > 0:
		velocity.normalized() * MAXSPEED
	velocity = move_and_slide(velocity)
	pass