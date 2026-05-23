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
