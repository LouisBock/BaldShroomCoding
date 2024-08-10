extends Node
# Game Manager for Scene Management

# Switch to Stat Upgrade UI - Shift + U
func _physics_process(delta):
	if Input.is_action_just_pressed("UI"):
		get_tree().change_scene_to_file("res://scenes/stat_interface.tscn")
