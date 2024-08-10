extends Node

# Character Stats
@export var max_health = 20
@export var fire_power = 10

# Leveling System
@export var level = 1

var experience = 0
var experience_total = 0
var experience_requirement = get_required_experience(level + 1)

func get_required_experience(level):
	# XP Curve
	return round (pow(level, 1.8) + level * 4)

func gain_experience(amount):
	experience_total += amount
	experience += amount
	while experience >= experience_requirement:
		experience -= experience_requirement
		level_up()

func level_up():
	level += 1
	experience_requirement = get_required_experience(level + 1)

# Later Stat Upgrade UI
func _on_upgrade_health_pressed():
	max_health += 10
	print(max_health)
