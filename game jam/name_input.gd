extends TextEdit
signal rc_name(text_set)

	
func _ready():
	emit_signal("rc_name",text_set)

func _process(delta):
	pass
