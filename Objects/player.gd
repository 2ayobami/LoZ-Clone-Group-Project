extends CharacterBody2D


const SPEED = 70.0

func _physics_process(_delta):

	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction:
		velocity = direction * SPEED
		set_sprite(direction)
		$Sprite.play()
	else:
		$Sprite.stop()
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func set_sprite(dir): #wont work on controller without extra effort because stick is analog and will output different values
	match Vector2(snappedf(dir.x, 0.000001), snappedf(dir.y, 0.000001)):
		Vector2(0.0, 1.0): #south
			$Sprite.animation = "South"
		Vector2(0.0, -1.0): #north
			$Sprite.animation = "North"
		Vector2(1.0, 0.0): #east
			$Sprite.animation = "SouthEast"
		Vector2(-1.0, 0.0): #west
			$Sprite.animation = "SouthWest"
		Vector2(0.707107, -0.707107): #northeast
			$Sprite.animation = "NorthEast"
		Vector2(-0.707107, -0.707107): #northwest
			$Sprite.animation = "NorthWest"
		Vector2(-0.707107, 0.707107): #southwest
			$Sprite.animation = "SouthWest"
		Vector2(0.707107, 0.707107): #southeast
			$Sprite.animation = "SouthEast"
