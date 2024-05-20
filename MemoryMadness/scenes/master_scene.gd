extends CanvasLayer


@onready var main_screen = $MainScreen
@onready var game_screen = $GameScreen
@onready var sound = $Sound

# Called when the node enters the scene tree for the first time.
func _ready():
	on_game_exit_pressed()
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)
	SignalManager.on_level_selection.connect(on_level_selection)
	
func show_game(show: bool) -> void:
	game_screen.visible = show 
	main_screen.visible = !show

func on_game_exit_pressed() -> void:
	show_game(false)
	SoundManager.play_sound(sound, SoundManager.SOUND_MAIN_MENU)

func on_level_selection(level_number: int) -> void:
	show_game(true)
	SoundManager.play_sound(sound, SoundManager.SOUND_IN_GAME)
