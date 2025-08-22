extends Node3D

@export var rotation_speed := 3.0
@onready var ball = get_node("../Ball")
@onready var ai_controller: AIController3D = $AIController3D

func _ready() -> void:
	ai_controller.init(self)

func game_over() -> void:
	ai_controller.done = true
	ai_controller.needs_reset = true

func _physics_process(delta: float) -> void:
	if ai_controller.needs_reset:
		ai_controller.reset()
		ball.reset() # your Ball.gd should implement reset()
		return

	var movement: float
	if ai_controller.heuristic == "human":
		# Optional: set these in Project Settings → Input Map (see below)
		movement = Input.get_axis("rotate_anticlockwise", "rotate_clockwise")
	else:
		movement = ai_controller.move_action

	rotate_y(movement * delta * rotation_speed)

# Call this when the ball hits the paddle (via Area3D or collision signal)
func _on_paddle_hit():
	ai_controller.reward += 1.0
