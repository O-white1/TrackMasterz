extends Area3D

@export var next_level = "world_"

func _on_body_entered(body):
	if body.is_in_group("Player"):
		#HUD.popuP.visible = true
		#HUD.popuPLabel = "Loading..."
		await get_tree().create_timer(0.1).timeout
		var lvl = "res://" + next_level + ".tscn"
		get_tree().change_scene_to_file(lvl)
