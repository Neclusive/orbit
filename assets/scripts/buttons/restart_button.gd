extends Button

func _on_pressed() -> void:
	Engine.time_scale = 1.0
	get_tree().paused = false
	$"../..".visible = false
	get_tree().reload_current_scene()
