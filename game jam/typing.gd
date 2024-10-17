extends Node2D
var rizz = 50
var text_list = ["Hello Mario.","Howdy RC. How's it going?",
	"Swimmingly, thanks for asking... So, tell me about yourself. I see you're a student as well, what's your major?",
	"I'm multiclassing in Game Design and CompSci at the University of Arizona. Bear Down!"]
var text_index = 0
var typeable = false

func _ready():
	pass 

func _process(delta):
	var current_text = text_list[text_index]
	$backdrop.text = current_text
	$rizz.text = "Rizz: "+str(rizz)
	
	if Input.is_action_just_pressed("enter") and typeable == false:
		text_index += 1
	if $typed.text == $backdrop.text and typeable == true:
		text_index += 1
	
	if text_index % 2 == 0:
		$typed.visible = false
		typeable = false
	elif text_index % 2 != 0:
		$typed.visible = true
		typeable = true
	
	var index = $typed.text.length() -1
	if index >=0 and $typed.text[index] != $backdrop.text[index] and typeable == true and $typed.text.length() >= 0:
		$typed.backspace()
		rizz-=1
		$AnimationPlayer.play("shake")
	
	pass
