extends Node

# Character Stats
@export var player_level = 1

@export var max_health = 20
@export var experience = 0

@export var skillpoints = 0

# Stat Upgrade (from: UI Stat Interface)
func HealthUp(health):
	max_health += health

# Stat Upgrade (from: Experience Orb)
func add_experience(exp):
	experience += exp

# Stat Upgrade (from UI Avatar coins(XP_Bar))
func level_up():
	player_level += 1
	# Gives one skillpoint upon levelling up
	skillpoints += 1
	print("(in character stats) New player lvl: " + str(player_level) + "\n(in character stats) Current Skillpoints: " + str(skillpoints))
