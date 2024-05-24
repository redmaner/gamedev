extends Node2D

@onready var player_camera = $PlayerCamera
@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# TODO: this should be moved to the player logic
# does not really make sense for the level to handle this
func _physics_process(delta):
	player_camera.position = player.position
