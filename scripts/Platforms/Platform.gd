extends AnimatableBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$anim_platform.play("move platform anim")
