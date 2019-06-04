extends HTTPRequest


func _ready():
	request("http://localhost:9000/maps/1")
