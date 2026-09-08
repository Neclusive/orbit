extends Line2D

@export var trail_duration: float = 0.5
@export var trail_width: float = 30.0
@export var trail_color := Color(0.0, 1.0, 0.0, 0.902)

var player: Node2D
var trail_initialized := false
var time_since_last_point: float = 0.0
# We define how often to add a point (e.g., every 0.02 seconds)
var point_interval: float = 0.02 

func _ready() -> void:
	visible = false
	player = get_parent() as Node2D

	top_level = true
	position = Vector2.ZERO
	rotation = 0.0
	scale = Vector2.ONE
	width = trail_width
	default_color = trail_color
	z_index = -1
	clear_points()
	
	if player == null:
		return
		
	await player.ready
	# Initialize with points at the start position to avoid a "snap"
	# We calculate how many points fit in the duration based on the interval
	var max_points = int(trail_duration / point_interval)
	for i in range(max_points):
		add_point(player.global_position)
	
	trail_initialized = true
	if Settings.trail_enabled:
		visible = true

func _process(delta: float) -> void:
	if not trail_initialized or player == null:
		return
		
	if Settings.trail_enabled:
		time_since_last_point += delta
		
		# Only add a point if enough time has passed
		if time_since_last_point >= point_interval:
			add_point(player.global_position)
			time_since_last_point = 0.0
			
			# Remove points based on time (Duration / Interval)
			var max_points = int(trail_duration / point_interval)
			while get_point_count() > max_points:
				remove_point(0)
