extends Node

# Character Stats
@export var max_health = 20
@export var experience = 0

# Stat Upgrade UI

func HealthUp(health):
	max_health += health

func add_experience():
	experience += 10
	print("Experience: " + str(experience))
