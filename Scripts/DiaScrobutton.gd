extends Button

#func _ready():
	#connect("pressed", on_pressed)
	#return
	#
#func on_pressed():
	#var dialogue: RichTextLabel = $"../Panel/vb/dialogue"
	#dialogue.text += "adding more text\n"
	#dialogue.on_option()
	#return

func _ready():
	connect("pressed", on_pressed)
	return
	
func on_pressed():
	var dialogue: RichTextLabel = $"../Panel/vb/dialogue"
	dialogue.text += "adding more text\n"
	dialogue.on_option()
	return
