extends Node2D

var pipes : Array
var index_control = 0

func _ready():
	for pipe in $Pipes.get_children():
		pipes.append(pipe)

func _on_Timer_timeout() -> void:
	if Global.is_alive:
		randomize()
		pipes[index_control].position = Vector2($SpawnUp.position.x, rand_range($SpawnUp.position.y, $SpawnDown.position.y))
		next_index()

func next_index():
	if index_control < pipes.size()-1:
		index_control += 1
	else:
		index_control = 0
