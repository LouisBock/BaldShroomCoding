extends RigidBody2D

@export var speed = 20
var target_pos = null

func _ready():
	gravity_scale = 0
	pass # Replace with function body.


func _physics_process(delta):
	target_pos = get_global_mouse_position()
	var direction = (target_pos - position).normalized()

	#TODO adjust to chain weight
	linear_velocity = direction * sqrt((target_pos - position).length()) * speed
	look_at(target_pos)
		
	
