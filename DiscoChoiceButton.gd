extends DialogicNode_ChoiceButton

func _load_info(info: Dictionary) -> void:
	# This line ensures the button still loads its normal text and data.
	super._load_info(info)
	
	# --- Your Disco Elysium Styling Goes Here ---
	# Set the text color to gold
	add_theme_color_override("font_color", Color("#d4af37"))
	# Set the text color when the mouse hovers over it
	add_theme_color_override("font_hover_color", Color("#f0e6a0"))
	# Remove default button background
	add_theme_stylebox_override("normal", StyleBoxEmpty.new())
	add_theme_stylebox_override("hover", StyleBoxEmpty.new())
	
	# Add the ">" prefix that gives it the Disco Elysium feel
	text = "> " + text
