extends Node2D

func _ready():
	var _connection = Global.connect("points_change", self, "change_counter")
	var _start = Global.connect("start_game", self, "start_game")

func start_game():
	$Counter02.visible = true

func change_counter(points):
	$PointSound.play()
	if points == 10:
		$Counter02.visible = false
		$Counter04.visible = true
		$Counter05.visible = true
	elif points == 100:
		$Counter01.visible = true
		$Counter02.visible = true
		$Counter03.visible = true
		$Counter04.visible = false
		$Counter05.visible = false
	if points < 10:
		$Counter02.frame = points
	elif points < 100:
		$Counter05.frame = points % 10
		points /= 10
		$Counter04.frame = points % 10
	elif points < 1000:
		$Counter03.frame = points % 10
		points /= 10
		$Counter02.frame = points % 10
		points /= 10
		$Counter01.frame = points % 10
