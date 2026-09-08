extends GPUParticles2D

func _ready() -> void:
	if Settings.stars_enabled:
		visible = true
	else: visible = false
