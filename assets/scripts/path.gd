extends Node2D

@export var radius: float = 450.0
@export var dash_degrees: float = 7.0
@export var gap_degrees: float = 5.0
@export var line_width: float = 4.0
@export var line_color: Color = Color.STEEL_BLUE

func _ready() -> void:
	var angle: float = 0.0

	while angle < 360.0:
		var dash: Line2D = Line2D.new()
		dash.width = line_width
		dash.default_color = line_color
		dash.antialiased = true

		var points: PackedVector2Array = PackedVector2Array()

		var end_angle: float = minf(
			angle + dash_degrees,
			360.0
		)

		var current_angle: float = angle

		while current_angle <= end_angle:
			var radians: float = deg_to_rad(current_angle)
			var point: Vector2 = Vector2(
				cos(radians),
				sin(radians)
			) * radius

			points.append(point)
			current_angle += 2.0

		dash.points = points
		add_child(dash)

		angle += dash_degrees + gap_degrees
		
		if Settings.path_enabled:
			visible = true
		else: visible = false

@export var rotation_speed: float = 0.3

func _process(delta: float) -> void:
	rotation += rotation_speed * delta
