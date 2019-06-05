extends Node2D


func _ready():
	$Cursor.connect("cursor_moved", self, "_on_cursor_moved")
	
func _on_cursor_moved(location : Vector2):
	print(location)
