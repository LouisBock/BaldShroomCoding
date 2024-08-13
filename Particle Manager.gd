extends Node

var particles_load = preload("res://scenes/Player Scene/Level_up_paritcles.tscn")
var player_position = Vector2(0, 0)

func Level_Up_Particles():
	var particles_instance = particles_load.instantiate()
	
	player_position = get_parent().get_node("Scene Objects/Player Root").get_node("Player").position
	
	particles_instance.position = player_position
	
	add_child(particles_instance)
	
