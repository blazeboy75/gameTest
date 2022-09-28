extends KinematicBody2D

const acc = 25
var max_speed = 50
const friction = 75
const walk_speed = 50
const run_speed = 80
var is_running = null
var motion = Vector2()

func _physics_process(delta):
	var input = Vector2()
	
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") -  Input.get_action_strength("ui_up")
	input = input.normalized()

	if Input.is_action_pressed("run"):
		is_running = true
	if Input.is_action_just_released("run"):
		is_running = false
	
	
	if input !=Vector2.ZERO:
		
		if input.x > 0:
			$AnimatedSprite.flip_h = false
			if is_running:
				$AnimatedSprite.play("running")
			else:
				$AnimatedSprite.play("running")
		else:
			$AnimatedSprite.flip_h = true
			if is_running:
				$AnimatedSprite.play("running")
			else:
				$AnimatedSprite.play("running")
			
		if is_running == true:
			max_speed = run_speed
		else:
			max_speed = walk_speed
		motion += input * acc * delta
		motion = motion.clamped(max_speed * delta)
	else:
		$AnimatedSprite.play("idle")
		motion = motion.move_toward(Vector2.ZERO, friction * delta)
	move_and_collide(motion)
