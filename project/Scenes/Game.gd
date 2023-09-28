extends Node2D

func _ready():
	$Gameover.visible = false
	var _connection = Global.connect("game_over", self, "hit")
	var _start_game = Global.connect("start_game", self, "start_game")

func hit():
	$Gameover.visible = true

func start_game():
	$Message.visible = false

func _input(event):
	if Global.menu:
		if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
			$SwooshSound.play()
			Global.start_game()
			$PipesSpawn/Timer.start()
	if not Global.is_alive:
		if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
			Global.restart()
