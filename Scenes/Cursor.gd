extends Area2D

func move(vector : Vector2):
	position = position + vector

func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		move(Vector2(-16, 0))
	if Input.is_action_just_pressed("ui_right"):
		move(Vector2(16, 0))
	if Input.is_action_just_pressed("ui_up"):
		move(Vector2(0, -16))
	if Input.is_action_just_pressed("ui_down"):
		move(Vector2(0, 16))