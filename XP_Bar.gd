extends ProgressBar

@onready var character_stats = %"Character Stats"

func _ready():
	self.value = character_stats.experience
	

func update_bar():
	# !! Value increased nicht über den max val
	self.value = character_stats.experience
	print("(in xp_bar) Current xp: " + str(self.value) + "/" + str(self.max_value))
	check_progress_bar()

# If progress bar at 100%; xp = 0 and xp needed *2
func check_progress_bar():
	if (self.value == self.max_value):
		self.max_value = self.max_value * 2
		print("(in xp_bar) New max xp value: " + str(max_value))
		character_stats.experience = 0
		self.value = 0
		# Level up
		character_stats.level_up()
