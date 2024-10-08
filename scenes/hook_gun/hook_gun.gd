extends Node2D

@export var max_chain_links = 25
@export var connection_depth = 0.8

var chain_link_prefab = preload("res://scenes/hook_gun/chain_link.tscn")
var hook_link_prefab = preload("res://scenes/hook_gun/hook_link.tscn")
var chain_link_length
var hook_gun_length

var links: Array[PhysicsBody2D] = []
var pin_joints: Array[PinJoint2D] = []

var active: bool = false
var hook_link = null

var fun: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var temporary_chain_link = chain_link_prefab.instantiate()
	add_child(temporary_chain_link)
	chain_link_length = temporary_chain_link.get_node("Sprite2D").texture.get_size().x * temporary_chain_link.get_node("Sprite2D").scale.x
	hook_gun_length = get_node("Sprite2D").texture.get_size().x * get_node("Sprite2D").scale.x
	remove_child(temporary_chain_link)
	temporary_chain_link.queue_free()
	

func _physics_process(delta):
	look_at(get_global_mouse_position())
	
	if active and links.size() < max_chain_links + 1:
		if (links.back().position - position).length() > chain_link_length:
			instantiate_next_link()
	
	if Input.is_action_just_pressed("fun"):
		fun = not fun
		if fun:
			max_chain_links += 2000
		else:
			max_chain_links -= 2000
		
	
	if Input.is_action_just_pressed("hook"):
		if active:
			for l in links:
				l.queue_free()
			links.clear()
			hook_link.queue_free()
			hook_link = null
		else:
			hook_link = hook_link_prefab.instantiate()	
			hook_link.position = position + hook_gun_length * (get_global_mouse_position() - position).normalized()
			if fun:
				hook_link.gravity_scale = 0
			get_parent().add_child(hook_link)
			links.append(hook_link)
		active = not active
		

func instantiate_next_link():
	var next_link = chain_link_prefab.instantiate()
	var previous = links.back()
		
	var direction_to_gun = (position - previous.position).normalized()
	var joint_position = previous.position + 0.5 * connection_depth * chain_link_length * direction_to_gun
	next_link.position = previous.position + connection_depth * chain_link_length * direction_to_gun
	next_link.rotation = tanh((direction_to_gun * -1).y / (direction_to_gun * -1).x)
	if fun:
		next_link.gravity_scale = 0
	get_parent().add_child(next_link)
	
	var joint = PinJoint2D.new()
	joint.set_node_a(next_link.get_path())
	joint.set_node_b(links.back().get_path())
	joint.position = joint_position
	pin_joints.append(joint)
	get_parent().add_child(joint)
	
	links.append(next_link)
