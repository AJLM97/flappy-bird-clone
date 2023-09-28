extends RigidBody2D

export var velocity = 2

func _ready():
	var _game_over = Global.connect("game_over", self, "hit")
	var _start_game = Global.connect("start_game", self, "start_game")

func start_game():
	self.mode = RigidBody2D.MODE_RIGID
	$AnimatedSprite.play()

func flap(state: Physics2DDirectBodyState):
	$WingSound.play()
	state.linear_velocity = Vector2.UP * velocity
	$AnimatedSprite.look_at($Up.global_position)

func hit():
	$AnimatedSprite.stop()
	$HitSound.play()

func _integrate_forces(state: Physics2DDirectBodyState) -> void:
	if not Global.menu:
		if state.linear_velocity.y > velocity * 0.25:
			$AnimatedSprite.rotation = lerp_angle($AnimatedSprite.rotation, $Down.position.normalized().angle(), 0.1)
		if not Global.is_alive:
			return
		if Input.is_action_just_pressed("flap"):
			flap(state)
