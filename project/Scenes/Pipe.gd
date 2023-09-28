extends Node2D

export var velocity = 2

func _physics_process(_delta: float) -> void:
	if Global.is_alive:
		position += Vector2.LEFT * velocity

func _on_Pipes_body_entered(body: Node) -> void:
	if body.name == "Bird" and Global.is_alive:
		Global.game_over()

func _on_Point_body_entered(body: Node) -> void:
	if body.name == "Bird" and Global.is_alive:
		Global.add_point()
