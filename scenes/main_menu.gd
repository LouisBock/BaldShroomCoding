extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_bt_start_game_pressed():
	print("Start pressed!")
	get_tree().change_scene_to_file("res://main_root.tscn")


func _on_bt_options_pressed():
	print("Options pressed!")


func _on_bt_exit_game_pressed():
	print("Exit pressed!")
	get_tree().quit()
