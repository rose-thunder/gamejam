extends Node2D

#var skinList = [$RCSkin.play("RC1"), $RCSkin.play("RC2"), $RCSkin.play("RC3"), $RCSkin.play("RC4")]
var index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#skinList[index]
	if index == 0:
		$RCSkin.play("RC1")
	elif index == 1:
		$RCSkin.play("RC2")
	elif index == 2:
		$RCSkin.play("RC3")
	elif index == 3:
		$RCSkin.play("RC4")
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
	pass # Replace with function body.
