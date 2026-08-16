extends Node2D

@export_file("*.tscn") var main_menu_path: String

func _on_button_pressed():
	SceneLoader.load_scene(main_menu_path)
