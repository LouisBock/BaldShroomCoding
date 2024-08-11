extends Node2D

# Declares a Signal
signal J_button_pressed

func _process(delta):
	if Input.is_action_just_pressed("J"):
		# Schickt oben deklariertes Signal wenn "j" gedrückt wurde
		emit_signal("J_button_pressed")
