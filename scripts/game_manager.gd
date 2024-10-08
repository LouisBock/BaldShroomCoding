# Game Manager for Scene Management
extends Node

# Variables
@onready var stat_interface = %"Stat Interface"
@onready var avatar_coin_panel = %Avatar_Coin_Panel

# Switch to Stat Upgrade UI - Shift + U
func _physics_process(delta):
	if Input.is_action_just_pressed("UI"):
		stat_interface.visible = true
		# "Deactivate" Avatar Coin Panel
		avatar_coin_panel.visible = false
		# Pause Game
		get_tree().paused = true
	
	# r key for restart input
	if Input.is_action_just_pressed("Restart"):
		restart_game()

# Future Options Menu

# Pause Game
func pause_game():
	get_tree().paused = true
	print("(in game_manager) Game was paused")

# Unpause Game
func unpause_game():
	get_tree().paused = false
	print("(in game_manager) Game was unpaused")

# Restart the game
func restart_game():
	get_tree().reload_current_scene()
