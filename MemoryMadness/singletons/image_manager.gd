extends Node

var _item_images: Array[ImageInfo] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	load_item_images()

func load_item_images() -> void:
	var path: String = "res://assets/glitch"
	var dir: DirAccess = DirAccess.open(path)
	
	if not dir:
		return
		
	var file_names: PackedStringArray = dir.get_files()
	
	for file_name in file_names:
		if ".import" not in file_name:
			add_file_to_list(file_name, path)
			
	print("loaded ", _item_images.size())
	

func add_file_to_list(name: String, path: String) -> void:
	var full_path: String = path + "/" + name 
	var info: ImageInfo = ImageInfo.new(name, full_path)
	_item_images.append(info)

func get_random_image() -> ImageInfo:
	return _item_images.pick_random()
