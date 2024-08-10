extends Area2D

@onready var coin_score = %"Coin Score"

func _on_body_entered(body):
	if (body.name == "Player"):
		queue_free()
		coin_score.add_points()
