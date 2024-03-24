extends Control

func _on_resume_pressed():
	get_parent().pause_menu()

func _on_quit_pressed():
	get_tree().quit()

func _on_start_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/start_menu.tscn")
	Engine.time_scale = 1
