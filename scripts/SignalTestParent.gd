extends Node2D

func _ready():
	# Ruft das child signal auf und löst die "Printer" function aus
	$SignalTestChild.J_button_pressed.connect(Printer)

func Printer():
	print ("J pressed")
