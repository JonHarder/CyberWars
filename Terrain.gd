extends TileMap

class Tile:
	const types = { 
		CONCRETE = "concrete"
	}
	var type
	
	func _init(type):
		self.type = type

var tiles : Array
var width : int

func draw_map():
	for i in range(tiles.size()):
		var tile_index = tile_set.find_tile_by_name(tiles[i].type)
		set_cellv(Vector2(i % width, floor(i / width)), tile_index)
	
	update_bitmask_region(Vector2(0, 0), Vector2(width, tiles.size() / width))

# Called when the node enters the scene tree for the first time.
func _ready():
	var tileset : TileSet = preload("res://tiles.tres")
	tile_set = tileset
	cell_size = Vector2(16, 16)
	tiles = [
		Tile.new(Tile.types.CONCRETE), Tile.new(Tile.types.CONCRETE),
		Tile.new(Tile.types.CONCRETE)
	]
	width = 2
	draw_map()
