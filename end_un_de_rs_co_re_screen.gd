extends Control

func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://world_1.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
