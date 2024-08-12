extends Label

var Display_HP = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Display_HP = get_parent().store_health_value

# Updates Stats when visible again; gets value from parent
func _on_visibility_changed():
	Display_HP = get_parent().store_health_value
	set_text("- Health: " + str(Display_HP))

# Updates Stats when Health Button pressed; gets value from parent
func _on_upgrade_health_pressed():
	Display_HP = get_parent().store_health_value
	set_text("- Health: " + str(Display_HP))
