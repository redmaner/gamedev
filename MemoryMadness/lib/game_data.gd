extends Node

class_name LevelData 

var _rows: int = 0
var _cols: int = 0
var _num_tiles: int = 0
var _target_pairs: int = 0
var _selected_level_images: Array[CompressedTexture2D] = []

func _init(rows: int, cols: int):
	_rows = rows 
	_cols = cols
	_num_tiles = rows * cols 
	@warning_ignore("integer_division")
	_target_pairs = _num_tiles / 2
	
	ImageManager.shuffle_images()
	
	for i in range(_target_pairs):
		_selected_level_images.append(ImageManager.get_image_by_index(i))
		_selected_level_images.append(ImageManager.get_image_by_index(i))
		
	_selected_level_images.shuffle()
