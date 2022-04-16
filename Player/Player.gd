extends KinematicBody2D

var velocity = Vector2.ZERO
const MaxSpeed = 500
const Acceleration = 100
const friction = 100

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized();
	if input_vector == Vector2.ZERO:
		velocity = velocity.move_toward(Vector2.ZERO, friction)
	else:
		velocity = velocity.move_toward(input_vector * MaxSpeed, Acceleration * delta)
	velocity = move_and_slide(velocity);
