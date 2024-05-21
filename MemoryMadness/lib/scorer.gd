extends Node

@onready var sound = $Sound
@onready var reveal_timer = $RevealTimer

var _selections: Array[MemoryTile] = []
var _target_pairs: int = 0
var _moves_made: int = 0
var _pairs_made: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_tile_selected.connect(on_tile_selected)
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)

func clear_new_game(target_pairs: int) -> void:
	_selections.clear()
	_target_pairs = target_pairs
	_moves_made = 0
	_pairs_made = 0
	
func update_selections() -> void:
	reveal_timer.start()
	if selections_are_pair():
		register_pair_made()
			
func register_pair_made() -> void:
	for tile in _selections:
		tile.hide_on_pair()
		
	_pairs_made += 1
	SoundManager.play_sound(sound, SoundManager.SOUND_SUCCESS)
	
func check_pair_made() -> void:
	if _selections.size() < 2:
		return
		
	SignalManager.on_selection_disabled.emit()
	_moves_made += 1
	
	update_selections()
	
func selections_are_pair() -> bool:
	return (_selections[0].item_name == _selections[1].item_name 
		and _selections[0].get_instance_id() != _selections[1].get_instance_id())

func on_tile_selected(tile: MemoryTile) -> void:
	SoundManager.play_sound(sound, SoundManager.SOUND_SELECT_TILE)
	_selections.append(tile)
	check_pair_made()

func _on_reveal_timer_timeout():
	for tile in _selections:
		tile.reveal(false)
		
	_selections.clear()
	SignalManager.on_selection_enabled.emit()
	
func on_game_exit_pressed() -> void:
	reveal_timer.stop()
