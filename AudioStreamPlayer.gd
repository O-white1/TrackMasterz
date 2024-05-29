extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play("res://Assets/Music/W Track.mp3")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
