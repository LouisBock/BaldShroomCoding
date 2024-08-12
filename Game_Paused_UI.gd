extends Control

@onready var game_manager = %"Game Manager"

var PauseOn = 0

func _ready():
	self.visible = false

# Detect Pause
func _process(delta):
	if Input.is_action_just_pressed("Pause") && PauseOn == 0:
		game_manager.pause_game()
		self.visible = true
		PauseOn = 1
	elif Input.is_action_just_pressed("Pause") && PauseOn == 1:
		game_manager.unpause_game()
		self.visible = false
		PauseOn = 0
