extends Node2D
var RC_name = 'Jebediah'
var timer = 30
var rizz = 50
var faded = 1
var text_list_one = ["Hello Eugene.","Howdy "+RC_name+". How's it going?",
	"Swimmingly, thanks for asking... So, tell me about yourself. I see you're a student as well, what's your major?",
	"I'm multiclassing in Game Design and CompSci at the University of Arizona. Bear Down!",
	"Wow! How interesting! I'm studying Business.",'Oh wow! That pairs well with Game Design!',
	'Yeah...sure. So, what do you like to do in your free time?','Oh where to start, I like Dungeons & Dragons, Magic: The Gathering, Yu-Gi-Oh, building the Gravity Device, reading, and competitive programming!',
	'Huh, interesting. And where are you from?',"I'm from Parker's Crossroads, Tennessee, but you're the only ten I see! *Ahem* It's a small town...",
	"Oh. So that's why you're such a silly little guy. So what's it like living in a small town?",'We have a canon!',
	'Just...in a field?',"Uhm, yeah. It's just in a field, in the middle of town, and you can see it from anywhere in town! It's really cool!",
	'How quaint! That\'s just like the war from my home!','Pardon?','Nothing, nothing! So, Dungeons & Dragons, eh? What got you into that?',
	'Oh I\'m SO glad you asked! Well, it all started when my dad DM\'ed a session in fourth grade and I died. Well, I didn\'t realize I had actually died until years later.',
	'Ah I see. So you\'re...dead?','No, no! The character I played died, not me. What about you though? What are you into?',
	"I\'m a bit of a collector, I collect silly little guys.",'WHAT?!','Bugs, silly! I collect...bugs.',
	'Oh, ok. I thought, since you said I was a silly little guy before...','You\'re just imagining things.',
	'The only thing I\'m imagining is you next to me at the altar.','Ughhhhhhh, I lost my number, can I have yours?',
	"(509) 369-6420. Would you like to go on another date? Y\'know, since you asked for my number and everything...",
	'Yeah!','The aquarium? Tomorrow? At 2?','See you then!','                           ']
var text_list_two = ["Hello there.","Nice to see you again!","And you as well.",
	"Thanks for agreeing to come here. It's one of my favorite spaces. I came here a lot when I was little.",
	"But of course. I'm happy to meet you in spaces you enjoy. Do you have a favorite species of fish?",
	"Not of fish, but yes! I like the cleaner shrimp. They're so goofy. There's one in particular here that I call Krill.",
	"He certainly must be one in a krillion. Haha!","He's a silly little guy, if you will. Another for your collection, although he isn't a bug.",
	"Another one for my collection indeed!","Haha, yeah! Do you have a favorite species of fish?",
	"I do, there's one specific to my home region that has the most beautiful green scales.",
	"Oh right! You didn't tell me where you were from!","I'm from Michigan!",
	"Oh cool! Where in Michigan? Detroit, Ann Arbor, Kalamazoo?","Ann Arbor.",
	"What's it like there?","It's...lovely. You should see it in the winter.",
	"I'd certainly love to, if you'd take me. I haven't seen snow since coming to Arizona a few years ago.",
	"Neither have I. It's been a long time since I've seen snow...","When I was younger I loved to make snowmen with my friends.",
	"That's nice. Speaking of youth, my collection hobby has been around as long as I can remember.",
	"What kind of bugs do you collect?","All types honestly, small, big, and medium sized.","That's so cool! Well, when do you wanna meet next?",
	"Let's do an arcade night tomorrow! How does that sound?","Alright let's meet up at 7:30, does that work?",
	"Yeah that works. I'll See ya later!","                      "]
var text_list_three = []
var the_script = [text_list_one,text_list_two,text_list_three]
var now_list = 0
var text_index = 29
var typeable = false
var minute_time = 5
var once_please = false
var death_time = 5

func _ready():
	pass 

func _process(delta):
	$scene.text = str(now_list)
	if text_index > len(the_script[now_list])-2:
		$fade.play("fadein")
		faded -= delta
		if faded <=0:
			text_index = 0
			faded = 1
			if now_list != 2:
				now_list+=1
			#if now_list == 2:
				#
	if text_index == 0 and once_please == false:
		$fade.play("fadeout")
		once_please = true
		$rizz.text = ""
	if text_index == 1:
		once_please = false
	
	var current_text = the_script[now_list][text_index]
	$backdrop.text = current_text
	#$rizz.text = "Rizz: "+str(rizz)+ ' Time: '+str(round(timer))
	$time.value = timer
	$rizzometer.value = rizz
	
	if Input.is_action_just_pressed("enter") and typeable == false:
		text_index += 1
	if $typed.text == $backdrop.text and typeable == true:
		rizz += round(timer/4)
		text_index += 1
		$typed.text = ''
	
	if text_index % 2 == 0:
		if text_index == 6 or text_index == 16:
			if now_list == 0:
				$time.max_value = 40
				timer = 40
		else:
			$time.max_value = 30
			timer = 30
		$typed.visible = false
		typeable = false
		$backdrop.set("theme_override_colors/font_color",Color(0.882, 0.597, 0.802))
		$name.text = RC_name
		$name.set("theme_override_colors/font_color",Color(0.882, 0.597, 0.802))
	elif text_index % 2 != 0:
		timer-=delta
		$typed.visible = true
		typeable = true
		$typed.grab_focus()
		$backdrop.set("theme_override_colors/font_color",Color(1,1,1,0.5))
		$name.text = "Eugene"
		$name.set("theme_override_colors/font_color",Color(1,0.469,0.172))
	
	var index = $typed.text.length() -1
	if index >=0 and $typed.text[index] != $backdrop.text[index] and typeable == true and $typed.text.length() >= 0:
		rizz-=1
		$typed.backspace()
		$AnimationPlayer.play("shake")
	
	if timer <= 0:
		rizz-=20
		timer = 30
		$typed.text = ''
		text_index+=1
	
	if rizz <= 0:
		if once_please == false:
			$fade.play("fadein")
			once_please = true
		$rizz.text = "You have no rizz,\nYou die."
		death_time-=delta
		if death_time <=0:
			$typed.text = ""
			text_index = 0
			rizz+=50
			death_time = 5
			once_please = false
	pass
