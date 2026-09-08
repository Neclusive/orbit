extends CanvasLayer

func _ready() -> void:
	visible = false
	$Control/Resume_Button.pressed.connect(resume_game)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		toggle_pause()

func toggle_pause() -> void:
	get_tree().paused = not get_tree().paused
	visible = get_tree().paused

func resume_game() -> void:
	get_tree().paused = false
	visible = false


func _on_pause_button_pressed() -> void:
	toggle_pause()
