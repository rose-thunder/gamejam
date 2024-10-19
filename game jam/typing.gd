extends Node2D
var timer = 30
var rizz = 50
var text_list = ["Hello Mario.","Howdy RC. How's it going?",
	"Swimmingly, thanks for asking... So, tell me about yourself. I see you're a student as well, what's your major?",
	"I'm multiclassing in Game Design and CompSci at the University of Arizona. Bear Down!",
	'Wow! How interesting! I’m studying Business.','Oh wow! That pairs well with Game Design!',
	'Yeah…sure!','So, what do you like to do in your free time? I like Dungeons & Dragons, Magic: The Gathering, Yu-Gi-Oh … For hobbies, I like to build the Gravity Device, read, make video games, and I do competitive programming!',
	'Huh, interesting. And where are you from?',' I’m from Parker’s Crossroads, Tennessee, and you’re the only ten I see! *Ahem* It’s a small town…',
	'Oh. So that’s why you’re such a silly little guy. So what’s it like living in a small town?','We have a canon!',
	'Just…in a field?','Uhm, yeah. It’s just in a field, in the middle of town, and you can see it from anywhere in town! It’s really cool!',
	'How quaint! That’s just like the war from my home!','Pardon?','Nothing, nothing! So, Dungeons & Dragons, eh? What got you into that?',
	'Oh I’m SO glad you asked! Well, it all started when my dad DM’ed a session in fourth grade and I died. Well, I didn’t realize I had actually died until years later.',
	'Ah I see. So you’re…dead?','No, no! The character I played died, not me. What about you though? What are you into?',
	'I’m a bit of a collector: I collect silly little guys.','WHAT?!','Bugs, silly! I collect…bugs.',
	'Oh, ok. I thought, since you said I was a silly little guy before…','You’re just imagining things.',
	'I’m imagining you next to me at the altar.','Ughhhhhhh, I lost my number, can I have yours?',
	'(509) 369-6420. Would you like to go on another date? Y’know, since you asked for my number and everything…',
	'Yeah!','The aquarium? Tomorrow? At 2?','See you then!']
var text_index = 0
var typeable = false

func _ready():
	pass 

func _process(delta):
	var current_text = text_list[text_index]
	$backdrop.text = current_text
	$rizz.text = "Rizz: "+str(rizz)+ ' Time: '+str(round(timer))
	
	if Input.is_action_just_pressed("enter") and typeable == false:
		text_index += 1
	if $typed.text == $backdrop.text and typeable == true:
		text_index += 1
		$typed.text = ''
	
	if text_index % 2 == 0:
		timer = 30
		$typed.visible = false
		typeable = false
		$backdrop.set("theme_override_colors/font_color",Color(0.882, 0.597, 0.802))
	elif text_index % 2 != 0:
		timer-=delta
		$typed.visible = true
		typeable = true
		$backdrop.set("theme_override_colors/font_color",Color(0,0,0))
	
	var index = $typed.text.length() -1
	if index >=0 and $typed.text[index] != $backdrop.text[index] and typeable == true and $typed.text.length() >= 0:
		rizz-=1
		$typed.backspace()
		$AnimationPlayer.play("shake")
	
	if timer <= 0:
		rizz-=10
		timer = 30
		text_index+=1
	pass
