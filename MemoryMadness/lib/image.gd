extends Node

class_name ImageInfo 

var _name: String
var _texture: Resource

func _init(name: String, path: String) -> void:
	_name = name.rstrip(".png")
	_texture = load(path)

func get_texture() -> Resource:
	return _texture
