extends Label

func _ready():
	text = "Skillpoints: " + str(get_parent().store_skillpoints)

func _on_visibility_changed():
	text = "Skillpoints: " + str(get_parent().store_skillpoints)

func _on_upgrade_health_pressed():
	text = "Skillpoints: " + str(get_parent().store_skillpoints)
