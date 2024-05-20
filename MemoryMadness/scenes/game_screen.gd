extends Control

@onready var sound = $Sound

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_button_pressed():
	SoundManager.play_sound(sound, SoundManager.SOUND_SELECT_BUTTON)
	SignalManager.on_game_exit_pressed.emit()
