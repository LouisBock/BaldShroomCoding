extends Node

@onready var score_label = %ScoreLabel

var score = 0

func add_points():
	score += 1
	score_label.text = "Score : " + str(score)
