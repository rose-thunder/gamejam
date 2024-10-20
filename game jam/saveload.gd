class_name Save
extends Node

var rc_name = ""
var skin = 0
var hair = 0

@onready var skin_sprite = get_node("/root/Character/RCSkin")
@onready var hair_sprite = get_node("/root/Character/RCHair")


func save_game():
	var config = ConfigFile.new()
	
	#config.set_value("RC", "name", rc_name)
	config.set_value("RC", "skin_tone", skin)
	config.set_value("RC", "hairstyle", hair)
	
	config.save("user://RC.cfg")
	
	print("Data Saved!")
	pass

func load_game():
	var rc_data = {}
	var config = ConfigFile.new()
	
	var err = config.load("user://RC.cfg")
	
	if err != OK:
		return
	
	for rc in config.get_sections():
		var load_name = config.get_value(rc, "name")
		var load_skin = config.get_value(rc, "skin_tone")
		var load_hair = config.get_value(rc, "hairstyle")
		rc_data[load_name] = [load_skin, load_hair]
	
	print("Data Loaded!")
	pass


func _on_text_edit_rc_name(text_set):
	rc_name = text_set
	pass


func _on_rc_skin_animation_changed():
	if skin_sprite.animation == "RC1":
		skin = 0
	elif skin_sprite.animation == "RC2":
		skin = 1
	elif skin_sprite.animation == "RC3":
		skin = 2
	elif skin_sprite.animation == "RC4":
		skin = 3
	pass
	

func _on_rc_hair_animation_changed():
	if hair_sprite.animation == "Cassidy":
		hair = 0
	elif hair_sprite.animation == "Elli":
		hair = 1
	elif hair_sprite.animation == "Jack":
		hair = 2
	elif hair_sprite.animation == "Renee":
		hair = 3
	pass
