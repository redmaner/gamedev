extends Node

class_name LevelData 

var rows: int = 0
var cols: int = 0
var _num_tiles: int = 0
var target_pairs: int = 0
var image_list: Array[ImageInfo] = []

func _init(rows: int, cols: int):
	self.rows = rows 
	self.cols = cols
	_num_tiles = rows * cols 
	@warning_ignore("integer_division")
	target_pairs = _num_tiles / 2
	
	ImageManager.shuffle_images()
	
	for i in range(target_pairs):
		image_list.append(ImageManager.get_image_by_index(i))
		image_list.append(ImageManager.get_image_by_index(i))
		
	image_list.shuffle()
