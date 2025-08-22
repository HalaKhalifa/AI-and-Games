extends AIController3D

# Action sampled from the Python policy
var move_action: float = 0.0

func init(player_ref: Node3D) -> void:
	_player = player_ref

func get_obs() -> Dictionary:
	# Observe the ball in the player's local frame (x,z) and its velocity
	var ball_pos: Vector3 = to_local(_player.ball.global_position)
	var ball_vel: Vector3 = to_local(_player.ball.linear_velocity)
	var obs = [ball_pos.x, ball_pos.z, ball_vel.x / 10.0, ball_vel.z / 10.0]
	return {"obs": obs}

func get_reward() -> float:
	# Reward is maintained by Player.gd (on hit +1, on miss end/penalty if desired)
	return reward

func get_action_space() -> Dictionary:
	return {
		"move_action": {
			"size": 1,
			"action_type": "continuous"
		}
	}

func set_action(action) -> void:
	# Clamp action to [-1, 1]
	move_action = clamp(action["move_action"][0], -1.0, 1.0)
