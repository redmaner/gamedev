extends Control

@onready var sound = $Sound

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_level_selection.connect(on_level_selection)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_exit_button_pressed():
	SoundManager.play_sound(sound, SoundManager.SOUND_SELECT_BUTTON)
	SignalManager.on_game_exit_pressed.emit()

func on_level_selection(number: int) -> void:
	var level_data: LevelData = GameManager.get_level_selection(number)
	var frame_image: CompressedTexture2D = ImageManager.get_random_frame_image()
