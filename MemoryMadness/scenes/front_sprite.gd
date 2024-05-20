extends TextureRect

const SCALE_SMALL: Vector2 = Vector2(0.1, 0.1)
const SCALE_NORMAL: Vector2 = Vector2(1.0, 1.0)
const SPIN_TIME_RANGE: Vector2 = Vector2(1.0, 2.0)
const ROTATION_RANGE: Vector2 = Vector2(-360, 360)
const SCALE_TIME: float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	run()
	
func set_random_image_texture() -> void:
	texture = ImageManager.get_random_image().get_texture()

func get_random(vec: Vector2) -> float:
	return randf_range(vec.x, vec.y)
	
func get_random_rotation() -> float:
	return deg_to_rad(get_random(ROTATION_RANGE))

func run() -> void: 
	var tween: Tween = get_tree().create_tween()
	tween.set_loops()
	tween.tween_callback(set_random_image_texture)
	tween.tween_property(self, "scale", SCALE_NORMAL, SCALE_TIME)
	tween.tween_property(self, "rotation", get_random_rotation(), get_random(SPIN_TIME_RANGE))
	tween.tween_property(self, "rotation", get_random_rotation(), get_random(SPIN_TIME_RANGE))
	tween.tween_property(self, "scale", SCALE_SMALL, SCALE_TIME)
