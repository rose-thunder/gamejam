class_name Save
extends Node

var rc_name = $textBox/TextEdit.text
var skin = $Customization.index
var hair = $Customization.index1

func save_game():
	var config = ConfigFile.new()
	
	config.set_value("RC", "name", rc_name)
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
