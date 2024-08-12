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

# Future Options Menu

# Pause Game
func pause_game():
	print("Game will be paused")
	get_tree().paused = true
	print("Game was paused")

# Unpause Game
func unpause_game():
	print("Game will be unpaused")
	get_tree().paused = false
	print("Game was unpaused")
