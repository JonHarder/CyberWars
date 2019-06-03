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

var MetalTile = Tile.new(Tile.types.METAL)
var ConcreteTile = Tile.new(Tile.types.CONCRETE)


func draw_map():
	for i in range(tiles.size()):
		var tile_index = tile_set.find_tile_by_name(tiles[i].type)
		set_cellv(Vector2(i % width, floor(i / width)), tile_index)
	
	update_bitmask_region(Vector2(0, 0), Vector2(width, tiles.size() / width))

func _ready():
	tile_set = preload("res://Tilesets/tiles.tres")
	cell_size = Vector2(16, 16)
	tiles = [
		ConcreteTile, ConcreteTile, MetalTile,
		ConcreteTile, ConcreteTile, MetalTile,
		MetalTile
	]
	width = 3
	
	draw_map()
