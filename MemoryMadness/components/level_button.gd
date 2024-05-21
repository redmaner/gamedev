extends TextureButton

@onready var label = $Label
@onready var sound = $Sound

var _level_number: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func set_level_number(number: int) -> void:
	_level_number = number
	var data = GameManager.LEVELS[_level_number]
	
	label.text = "%sx%x" % [data.rows, data.cols]


func _on_pressed():
	SoundManager.play_sound(sound, SoundManager.SOUND_SELECT_BUTTON)
	SignalManager.on_level_selection.emit(_level_number)
