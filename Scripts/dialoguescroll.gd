#extends RichTextLabel
#
##var is_first_line := true
#
#func _ready():
	## Connect to the correct Dialogic Text subsystem signals
	#Dialogic.Text.about_to_show_text.connect(_on_about_to_show_text)
	##Dialogic.Text.text_finished.connect(_on_text_finished)
	#
	## Clear any default text
	#text = ""
#
#func _on_about_to_show_text(info: Dictionary):
	## This fires right before text is displayed
	## info contains data about the current text event
	#var new_text = info.get("text", "")
	#
	## Add spacing for first line only
	##if is_first_line:
		##for _i in range(20):
			##text += "\n"
		##is_first_line = false
	#
	#text += new_text + '\n'
	#_scroll_to_bottom()
#
##func _on_text_finished(_info: Dictionary):
	## Optional: This fires after text finishes displaying
	## You could add a "Continue" prompt here if desired
	##pass
#
#func _scroll_to_bottom():
	#var tween: Tween = create_tween()
	#tween.set_ease(Tween.EASE_IN_OUT)
	#var scroll: ScrollBar = get_v_scroll_bar()
	#var m: float = scroll.get_max()
	#var v: float = scroll.get_value()
	#tween.tween_method(scroll.set_value, v, m, 0.55)
	
extends RichTextLabel

var padding_added := false

func _ready():
	fit_content = true
	scroll_active = true
	autowrap_mode = TextServer.AUTOWRAP_WORD
	
	# Add padding once at start
	if not padding_added:
		for _i in range(5):
			text += "\n"
		padding_added = true
	
	Dialogic.Text.about_to_show_text.connect(_on_about_to_show_text)

func _on_about_to_show_text(info: Dictionary):
	var new_text = info.get("text", "")
	
	# Append the new text below existing content
	# This preserves the padding at the top
	text += new_text + "\n\n"
	
	_scroll_to_bottom()

func _scroll_to_bottom():
	await get_tree().process_frame
	var scroll_bar = get_v_scroll_bar()
	if scroll_bar:
		scroll_bar.set_value(scroll_bar.max_value)
