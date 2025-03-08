extends CharacterBody2D

@export var movement_speed : float = 500
var character_direction : Vector2

func _physics_process(_delta):
	character_direction.x = Input.get_axis("left", "right")
	character_direction.y = Input.get_axis("up", "down")
	
	
	if character_direction.x > 0: 
		%sprite.flip_h = false
	elif character_direction.x < 0: 
		%sprite.flip_h = true
	
	if character_direction:
		velocity = character_direction * (movement_speed * (.5 / (abs(character_direction.x) + abs(character_direction.y))))
		if %sprite.animation != "walking":
			%sprite.animation = "walking"
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		if %sprite.animation != "idle":
			%sprite.animation = "idle"
		
	move_and_slide()
