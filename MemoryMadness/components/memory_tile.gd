extends TextureButton

class_name MemoryTile

@onready var frame_image = $FrameImage
@onready var item_image = $ItemImage

var item_name: String
var _can_select_me: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_selection_enabled.connect(on_selection_enabled)
	SignalManager.on_selection_disabled.connect(on_selection_disabled)

func setup(info: ImageInfo, frame_texture: CompressedTexture2D) -> void:
	frame_image.texture = frame_texture
	item_image.texture = info.texture
	item_name = info.name
	reveal(false)
	
func on_selection_enabled() -> void:
	_can_select_me = true
	
func on_selection_disabled() -> void:
	_can_select_me = false

func reveal(reveal_me: bool) -> void:
	frame_image.visible = reveal_me
	item_image.visible = reveal_me

func _on_pressed():
	if _can_select_me:
		reveal(true)
		SignalManager.on_tile_selected.emit(self)
		
func hide_on_pair() -> void:
	z_index = 1
	var tween: Tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "disabled", true, 0)
	tween.tween_property(self, "rotation", deg_to_rad(720), 0.5)
	tween.tween_property(self, "scale", Vector2(1.5, 1.5), 0.5)
	tween.set_parallel(false)
	tween.tween_interval(0.6)
	tween.tween_property(self, "scale", Vector2(0, 0), 0)
