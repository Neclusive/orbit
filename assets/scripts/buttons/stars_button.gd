extends Button

func _ready():
	if !OS.has_feature("pc"):
		self.toggle_mode = false
		self.disabled = true
