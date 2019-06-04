extends Node2D


func _ready():
	$GetMapData.connect("request_completed", self, "_on_request_completed")


func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
		
	$Terrain.init_map(json.result)	
