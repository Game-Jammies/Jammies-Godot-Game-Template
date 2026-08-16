class_name GameState
extends Resource

const STATE_NAME : String = "GameState"
const FILE_PATH = "user://global_state.tres"



## The scene to load so the player can continue where they left off.
@export var continue_scene_path : String



## The canonical instance of this class.
static var _instance : GameState

static func get_continue_scene_path() -> String:
	if not _instance: 
		return ""
	load_state()
	return _instance.continue_scene_path

static func set_continue_scene_path(level_path : String) -> void:
	load_state()
	_instance.continue_scene_path = level_path
	save_state()

static func reset() -> void:
	load_state()
	_instance.continue_scene_path = ""
	save_state()



## If `GameState._instance` is not defined, try to load it from file or just create a new one.
static func load_state() -> void:
	if _instance is GameState: 
		return
	if FileAccess.file_exists(FILE_PATH):
		_instance = ResourceLoader.load(FILE_PATH)
		print("loaded instance: ", _instance)
	if not _instance:
		_instance = GameState.new()
		print("created instance: ", _instance)

## Saves the current instance using the resource saver.
static func save_state() -> void:
	if _instance is GameState:
		ResourceSaver.save(_instance, FILE_PATH)
