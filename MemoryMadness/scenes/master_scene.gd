extends CanvasLayer


@onready var main_screen = $MainScreen
@onready var game_screen = $GameScreen
@onready var sound = $Sound

# Called when the node enters the scene tree for the first time.
func _ready():
	on_game_exit_pressed()
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)
	SignalManager.on_level_selection.connect(on_level_selection)
	
func show_game(should_show: bool) -> void:
	game_screen.visible = should_show 
	main_screen.visible = !should_show

func on_game_exit_pressed() -> void:
	show_game(false)
	GameManager.clear_nodes_of_group(GameManager.GROUP_TILE)
	SoundManager.play_sound(sound, SoundManager.SOUND_MAIN_MENU)

func on_level_selection(_level_number: int) -> void:
	show_game(true)
	SoundManager.play_sound(sound, SoundManager.SOUND_IN_GAME)
