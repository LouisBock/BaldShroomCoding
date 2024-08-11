extends Node2D

@onready var rigid_body_2d = $RigidBody2D

func _on_rigid_body_2d_body_entered(body):
	if (body.name == "Player"):
		print("YOU DIED")

