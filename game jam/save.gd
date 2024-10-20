class_name Save
extends Node



func save_game():
	var save_file = FileAccess.open("res://save_file.json", FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	
	for node in save_nodes:
		
		if node.scene_file_path.is_empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue
		
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue
		
		var node_data = node.call("save")
		
		var json_string = JSON.stringify(node_data)
		
		save_file.store_line(json_string)
	pass

func load_game():
	if not FileAccess.file_exists("res://save_file.json"):
		return
	
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		node.queue_free()
	
	var save_file = FileAccess.open("res://save_file.json", FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()
		
		var json = JSON.new()
		
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
			
		var node_data = json.data
		
		var new_object = load(node_data["filename"]).instantiate()
		get_node(node_data["parent"]).add_child(new_object)
		new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])
		
		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
				continue
			new_object.set(i, node_data[i])
	pass
