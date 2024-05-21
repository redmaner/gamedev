extends Node

class_name ImageInfo 


var texture: Resource

func _init(image_name: String, path: String) -> void:
	name = image_name.rstrip(".png")
	texture = load(path)

