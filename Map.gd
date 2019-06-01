extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var map := TileMap.new()
	map.cell_size = Vector2(16, 16)
	map.name = "TileMapName"
	
	var tileset : TileSet = load("res://tiles.tres")
	map.tile_set = tileset
	
	var concrete = tileset.find_tile_by_name('concrete')
	print_debug("tile id: " + str(concrete))
	
	map.set_cellv(Vector2(0, 0), concrete)
	map.set_cellv(Vector2(1, 0), concrete)
	map.set_cellv(Vector2(0, 1), concrete)
	map.update_bitmask_region(Vector2(0, 0), Vector2(4, 4))
	
	add_child(map)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
