extends Button

func on_pressed():
	if !OS.has_feature("pc"):
		self.toggle_mode = false
		self.disabled = true
