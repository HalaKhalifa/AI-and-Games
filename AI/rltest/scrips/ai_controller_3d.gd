extends AIController3D

var move = Vector2.ZERO

@onready var cube: CharacterBody3D = $".."
@onready var target: Area3D = get_parent().get_parent().get_node("Target")

func get_obs() -> Dictionary:
	var obs :=[
	cube.position.x,
	cube.position.z,
	target.position.x,
	target.position.z
	]
	return {"obs":obs}

func get_reward() -> float:	
	return reward
	
func get_action_space() -> Dictionary:
	return {
		"move" : {
			"size": 2,
			"action_type": "continuous"
		},
		}
	
func set_action(action) -> void:	
	move.x = action ["move"] [0]
	move.y = action ["move"] [1]

func reset():
	move = Vector2.ZERO
	reward = 0.0
	cube.position = Vector3(-2.911, 0.635, 0)
