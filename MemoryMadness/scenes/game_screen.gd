extends Control

@export var memory_tile_scene: PackedScene

@onready var tile_container = $HBoxContainer/MC/TileContainer
@onready var sound = $Sound
@onready var scorer = $Scorer

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_level_selection.connect(on_level_selection)

func _on_exit_button_pressed():
	SoundManager.play_sound(sound, SoundManager.SOUND_SELECT_BUTTON)
	SignalManager.on_game_exit_pressed.emit()

func on_level_selection(number: int) -> void:
	var level_data: LevelData = GameManager.get_level_selection(number)
	var frame_image: CompressedTexture2D = ImageManager.get_random_frame_image()
	
	tile_container.columns = level_data.cols
	
	for image_info in level_data.image_list:
		add_memory_tile(image_info, frame_image)
		
	scorer.clear_new_game(level_data.target_pairs)
	
func add_memory_tile(image_info: ImageInfo, frame_image: CompressedTexture2D) -> void:
	var new_tile = memory_tile_scene.instantiate()
	tile_container.add_child(new_tile)
	new_tile.setup(image_info, frame_image)
