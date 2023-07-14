extends Control

func _on_PlayButton_pressed():
	get_tree().change_scene_to(GS.Game)


func _on_ControlsButton_pressed():
	$Control.popup()
