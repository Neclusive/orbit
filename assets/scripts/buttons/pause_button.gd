extends Button
func _ready():
	self.visible = OS.has_feature("mobile")
