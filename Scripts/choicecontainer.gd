extends VBoxContainer

func _ready():
	# Connect to the CORRECT signals
	Dialogic.Choices.choice_buttons_shown.connect(_on_choices_shown)  # Fixed function name
	Dialogic.Choices.choice_selected.connect(_on_choice_selected)
	hide()

func _on_choices_shown(choice_info: Dictionary):
	# Clear any existing choice buttons
	_clear_choices()
	
	# Get the choices array from the signal
	var choices_array: Array = choice_info.get("choices", [])
	
	# Create a button for each choice
	for choice in choices_array:
		var button = Button.new()
		button.text = "> " + choice.get("text", "Option")
		
		# Style for Disco Elysium look
		button.add_theme_color_override("font_color", Color("#d4af37"))
		button.add_theme_color_override("font_hover_color", Color("#f0e6a0"))
		
		# Connect the button's pressed signal
		var button_index = choice.get("button_index", 0)
		button.pressed.connect(_on_choice_button_pressed.bind(button_index))
		
		add_child(button)
	
	show()

func _on_choice_button_pressed(button_index: int):
	# Tell Dialogic which choice was selected
	Dialogic.Choices.select_choice(button_index)

func _on_choice_selected(_choice_info: Dictionary):
	# Choice was made - clear the UI
	_clear_choices()
	hide()

func _clear_choices():
	for child in get_children():
		child.queue_free()

## Preload your custom button scene, or create a Button node directly in the script.
## (If you haven't made a custom scene, the script will just create a plain Button.)
#@export var choice_button_scene: PackedScene
#
#func _ready():
	## Connect to the official signal for when choices are shown [citation:1]
	#Dialogic.Choices.choice_buttons_shown.connect(_on_choices_shown)
	#hide()
#
#func _on_choices_shown(choice_info: Dictionary):
	## Clear any previous choice buttons
	#_clear_choices()
#
	## Get the array of choices from the signal's info dictionary [citation:1]
	#var choices_array: Array = choice_info.get("choices", [])
	#
	## Create a button for each available choice
	#for choice in choices_array:
		## Determine which button to create
		#var button: Button
		#if choice_button_scene:
			#button = choice_button_scene.instantiate()
		#else:
			## Create a standard button if no custom scene is provided
			#button = Button.new()
		#
		## Set the button's text
		#button.text = choice.get("text", "Option")
		#
		## --- Apply your Disco Elysium Styling ---
		#button.add_theme_color_override("font_color", Color("#d4af37"))
		#button.add_theme_color_override("font_hover_color", Color("#f0e6a0"))
		#button.text = "> " + button.text
		## ----------------------------------------
#
		## Connect the button's pressed signal
		## The index is needed to tell Dialogic which choice was made [citation:1]
		#var button_index = choice.get("button_index", 0)
		#button.pressed.connect(_on_choice_button_pressed.bind(button_index))
		#
		## Add the button to the UI container
		#add_child(button)
	#
	## Show the container now that it has buttons
	#show()
#
#func _on_choice_button_pressed(button_index: int):
	## Tell the Dialogic system which choice the player selected [citation:1]
	#Dialogic.Choices.select_choice(button_index)
	#
	## Clear the UI buttons
	#_clear_choices()
	#hide()
#
#func _clear_choices():
	## Safely remove all child buttons
	#for child in get_children():
		#if child is Button:
			#child.queue_free()
