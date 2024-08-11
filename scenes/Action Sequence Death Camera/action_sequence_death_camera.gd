extends Node2D

@export var player: Node2D 
@onready var area = $Area2D
@onready var cam = $Area2D/Camera2D
var speed = 200

func _ready():
	cam.position.x = cam.get_viewport().size[0]*0.5

func _process(delta):
	area.move_local_x(delta * speed)
	area.position.y = player.position.y - cam.get_viewport().size[1]*0.5

func _on_area_2d_body_entered(body):
	print(body.name)
	if (body.name == "Player"):
		print("YOU DIED")# Replace with function body.
