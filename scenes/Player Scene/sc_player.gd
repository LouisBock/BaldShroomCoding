extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -330.0
@onready var sprite_2d = $Sprite2D #Drag n Drop + Ctrl from scene tree


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("space_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# Define Input Maps in project settings
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# Sprite Inversion
	if Input.is_action_just_pressed("move_left"):
		sprite_2d.flip_h = true
	if Input.is_action_just_pressed("move_right"):
		sprite_2d.flip_h = false

	# To Do: (Case Sensitive) Example in Player
