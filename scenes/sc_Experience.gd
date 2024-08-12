extends Area2D

# Nodes
@onready var xp_bar = %XP_Bar
@onready var character_stats = %"Character Stats"

func _on_body_entered(body):
	if (body.name == "Player"):
		character_stats.add_experience(10)
		# Update UI
		update_experience_bar()
		# Delete Obj.
		queue_free()

# UI Element in Avatar Coin Node 2D
func update_experience_bar():
	xp_bar.update_bar()
