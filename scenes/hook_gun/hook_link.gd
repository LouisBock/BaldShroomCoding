extends RigidBody2D

@export var speed = 10
var target_pos = null

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	target_pos = get_global_mouse_position()
	var direction = (target_pos - position).normalized()
	
	linear_velocity = direction * (target_pos - position).length() * speed
	#look_at(target_pos)
	
	#if((target_pos - position).length() > 50):
		#	add_constant_force(direction * speed * delta)
