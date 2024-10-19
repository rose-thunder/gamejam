class_name Save
extends Node
@onready var player = $

func save_game():
	var file = FileAccess.open("res://savegame.data", FileAccess.WRITE)
	
	pass

func load_game():
	pass
