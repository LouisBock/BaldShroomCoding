extends Node

# Character Stats
@export var max_health = 20
@export var experience = 0

# Stat Upgrade UI

func HealthUp():
	max_health += 10
