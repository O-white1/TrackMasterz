extends Node3D
@onready var song = "res://Assets/Music/Stage 1 Theme_.mp3"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.stream
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
