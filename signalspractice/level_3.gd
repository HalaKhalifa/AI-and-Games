extends Node2D

@onready var enemy_scene = preload("res://enemy.tscn")
func _on_timer_timeout() -> void:
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.position = Vector2(randf_range (45,1920), -20)
	add_child (enemy_instance)
