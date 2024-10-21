extends Node2D

var save = Save.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	if not FileAccess.file_exists("user://RC.cfg"):
		get_tree().change_scene_to_file("res://characterCustomization.tscn")
	else:
		save.load_game()
		get_tree().change_scene_to_file("res://typingBackground.tscn")
	pass # Replace with function body.
