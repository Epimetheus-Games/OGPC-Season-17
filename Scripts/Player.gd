extends CharacterBody2D

# Speed multiplier for the player
@export var speed = 0.1
@export var jump_vel = 10
@export var gravity = 0.5

# Figure out the velocity based on the inputs.
func getInputVelocity():
	var input_direction = Input.get_axis("left", "right")
	return input_direction * speed
	
func checkJump():
	return Input.is_action_just_pressed("jump")
	
func canJump():
	return is_on_floor()

func _physics_process(_delta):
	# Apply gravity
	velocity.y += gravity
	
	# Add velocity to position.
	position += velocity
	
	# Apply keyboard inputs.
	velocity.x += getInputVelocity()
	if checkJump() and canJump():
		velocity.y = -jump_vel
	
	# Collisions.
	move_and_slide()
	
