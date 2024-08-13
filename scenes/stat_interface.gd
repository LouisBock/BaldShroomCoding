extends Control

# Vars, will be pulled from Char Stats for lb stats to inherit; 
# set to 0 bc str() will display <null> otherwise
var store_health_value = 0
var store_skillpoints = 0

# Vars
@onready var character_stats = %"Character Stats"
@onready var avatar_coin_panel = %Avatar_Coin_Panel
@onready var game_manager = %"Game Manager"

func _ready():
	self.visible = false
	store_health_value = character_stats.max_health
	store_skillpoints = character_stats.skillpoints

# Button Conttrol 
# Resume
func _on_resume_pressed():
	self.visible = false
	avatar_coin_panel.visible = true
	# Unpause game
	get_tree().paused = false

# Health Increase
func _on_upgrade_health_pressed():
	if character_stats.skillpoints >= 1:
		character_stats.HealthUp(10)
		# Stores health value from Character Stats to pass down to child lb stats
		store_health_value = character_stats.max_health
		# Health button pressed --> -1 skillpoint
		character_stats.skillpoints -= 1
		store_skillpoints = character_stats.skillpoints

# Update stats
func _on_visibility_changed():
	store_skillpoints = character_stats.skillpoints
