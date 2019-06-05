extends Area2D

signal cursor_moved

func move(vector : Vector2):
	position = position + vector

func _process(delta):
	var moved = false
	if Input.is_action_just_pressed("ui_left"):
		move(Vector2(-16, 0))
		moved = true
	if Input.is_action_just_pressed("ui_right"):
		move(Vector2(16, 0))
		moved = true
	if Input.is_action_just_pressed("ui_up"):
		move(Vector2(0, -16))
		moved = true
	if Input.is_action_just_pressed("ui_down"):
		move(Vector2(0, 16))
		moved = true

	if moved:
		var tile_pos = Vector2((position.x - 8) / 16, (position.y - 8) / 16)
		emit_signal("cursor_moved", tile_pos)