extends Node2D

#var skinList = [$RCSkin.play("RC1"), $RCSkin.play("RC2"), $RCSkin.play("RC3"), $RCSkin.play("RC4")]
var index = 0
var index1 = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var RCName = $textBox/TextEdit.text
	
	Global.set("RC", RCName)
	Global.set("index", index)
	Global.set("index1", index1)
	
	if index == 0:
		$RCSkin.play("RC1")
	elif index == 1:
		$RCSkin.play("RC2")
	elif index == 2:
		$RCSkin.play("RC3")
	elif index == 3:
		$RCSkin.play("RC4")
		
	if index1 == 0:
		$RCHair.play("Cassidy")
	elif index1 == 1:
		$RCHair.play("Elli")
	elif index1 == 2:
		$RCHair.play("Jack")
	elif index1 == 3:
		$RCHair.play("Renee")
	pass


func _on_left_pressed() -> void:
	if index - 1 == -1:
		index = 3
	else:
		index -= 1
	pass # Replace with function body.


func _on_right_pressed() -> void:
	if index + 1 == 4:
		index = 0
	else:
		index += 1
	pass

func _on_start_pressed() -> void:
	var save = Save.new()
	save.save_game()
	get_tree().change_scene_to_file("res://typingBackground.tscn")
	pass # Replace with function body.


func _on_left_1_pressed() -> void:
	if index1 - 1 == -1:
		index1 = 3
	else:
		index1 -= 1
	pass # Replace with function body.


func _on_right_1_pressed() -> void:
	if index1 + 1 == 4:
		index1 = 0
	else:
		index1 += 1
	pass # Replace with function body.
