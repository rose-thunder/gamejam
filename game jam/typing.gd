extends Node2D
var rizz = 50
var current_text = " It's a me, a Mario\n Oh a no, I a lost me pizza :("

func _ready():
	$backdrop.text = current_text
	pass 

func _process(delta):
	var index = $typed.text.length() - 1
	if $typed.text[index] != $backdrop.text[index]:
		rizz-=1
		$typed.backspace()
		$AnimationPlayer.play("shake")
	$rizz.text = "Rizz: "+str(rizz)
	pass
