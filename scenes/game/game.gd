extends Node2D

@export var scene_refs: SceneRefs

func _on_button_pressed():
	SceneLoader.load_scene(scene_refs.main_menu)
