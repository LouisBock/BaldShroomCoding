extends Node

# Character Stats
@export var max_health = 20
@export var experience = 0

@export var player_level = 0

# Stat Upgrade UI
func HealthUp(health):
	max_health += health

func add_experience(exp):
	experience += exp
