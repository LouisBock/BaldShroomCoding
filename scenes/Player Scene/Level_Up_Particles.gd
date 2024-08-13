extends CPUParticles2D

func _ready():
	one_shot = true
# To Do: delete Node after animation

func _on_timer_timeout():
	get_parent().queue_free()
