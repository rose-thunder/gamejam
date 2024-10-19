extends Node2D
var timer = 5
var played = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer <= 0 && played == false:
		played = true
		$AnimationPlayer.play("fade")
	else:
		timer -= delta
	pass


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/typing.tscn")
	pass # Replace with function body.
