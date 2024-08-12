extends Node

# Wanted x pos where animation should play
@export var x_left = 15
@export var x_right = -30

# Wanted y pos where animation should play
@export var y_pos = -20

@export var speed = 1

var max_distance_diff = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$animAeri.play("idle")

func _process(delta):
	# Reset pos. to left, when player goes left
	if Input.is_action_just_pressed("move_left"):
		self.position.x = x_left
		self.position.y = y_pos
	
	# Aeri pos. goes to the left with movement; to certain extend
	if Input.is_action_pressed("move_left"):
		self.position.x += speed
		max_distance_diff += 1
		if (max_distance_diff >= 50):
			speed = 0
	
	# Reset pos. to right, when player goes right
	if Input.is_action_just_pressed("move_right"):
		self.position.x = x_right
		self.position.y = y_pos
	
	# Aeri pos. goes to the right with movement; to certain extend
	if Input.is_action_pressed("move_right"):
		self.position.x -= speed
		max_distance_diff += 1
		if (max_distance_diff >= 50):
			speed = 0
	
	if Input.is_action_just_released("move_left"):
		max_distance_diff = 0
		speed = 1
		
		move_back_left()
	
	if Input.is_action_just_released("move_right"):
		max_distance_diff = 0
		speed = 1
		
		move_back_right()
	

# Funktionen, um Aeri wieder auf die Ursprungsposition zurück zu führen
# To Do: Hier actual path zurück implementieren
func move_back_left():
	if self.position.x != 15:
		self.position.x = 15
		

func move_back_right():
	if self.position.x != -30:
		self.position.x = -30
		

