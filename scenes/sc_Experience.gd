extends Area2D

@onready var character_stats = %"Character Stats"

func _on_body_entered(body):
	if (body.name == "Player"):
		character_stats.add_experience()
		queue_free()
