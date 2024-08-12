extends ProgressBar

@onready var character_stats = %"Character Stats"

func _ready():
	self.value = character_stats.experience
	

func update_bar():
	# !! Value increased nicht über den max val
	self.value = character_stats.experience
	print("Current xp: " + str(self.value))
	check_level()

func check_level():
	if (self.value == self.max_value):
		self.max_value = self.max_value * 2
		print("Max value: " + str(max_value))
		character_stats.experience = 0
		print(character_stats.experience)
		self.value = 0
		# To Do: Add level up + add skill point for level up
