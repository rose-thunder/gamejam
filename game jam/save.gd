class_name Save
extends Node

@onready var rc1 = $RC1
@onready var rc2 = $RC2
@onready var rc3 = $RC3
@onready var rc4 = $RC4

var skin = [rc1, rc2, rc3, rc4]

func save_game():
	var file = FileAccess.open("res://savegame.data", FileAccess.WRITE)
	
	var saved_data = {}
	
	pass

func load_game():
	pass
