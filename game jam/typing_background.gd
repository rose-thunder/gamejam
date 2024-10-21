extends Node2D
var scene = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scene = int($Typing/scene.text)
	if scene == 0:
		$background.play("union")
	elif scene == 1:
		$background.play("aquarium")
	elif scene == 2:
		$background.play("arcade")
	pass
