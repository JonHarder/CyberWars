extends TileMap

var tiles : Array
var width : int


class Tile:
	const types = {
		CONCRETE = "concrete",
		METAL = "metal"
	}
	var type
	
	func _init(type):
		self.type = type


func draw_map():
	for i in range(tiles.size()):
		var tile_index = tile_set.find_tile_by_name(tiles[i].type)
		set_cellv(Vector2(i % width, i / width), tile_index)
	update_bitmask_region(Vector2(0, 0), Vector2(width, tiles.size() / width))


func init_map(tile_data):
	var parsed_tiles = []
	width = tile_data["width"]
	for data in tile_data["tiles"]:
		parsed_tiles.append(Tile.new(data))
	tiles = parsed_tiles
	
	draw_map()


func _ready():
	tile_set = preload("res://Tilesets/tiles.tres")
	cell_size = Vector2(16, 16)
