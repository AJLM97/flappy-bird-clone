extends Node

var points = 0
var is_alive = false
var menu = true

signal points_change(points)
signal game_over()
signal start_game()

func add_point():
	points += 1
	emit_signal("points_change", points)

func start_game():
	is_alive = true
	menu = false
	emit_signal("start_game")

func game_over():
	is_alive = false
	emit_signal("game_over")

func restart():
	is_alive = false
	menu = true
	points = 0
	var _value = get_tree().reload_current_scene()
