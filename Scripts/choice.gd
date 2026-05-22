extends RichTextLabel


# Called when the node enters the scene tree for the first time.
#func _ready():
	#connect("meta_clicked" , $"../dialogue".add_t)
	#on_option()
	#return
	
#func on_option():
	#for i in range(1, 5):
		#text+= "[url]%d. %s[/url]\n" % [i, "Option"]
	#return
	


# Called when the node enters the scene tree for the first time.
#func _ready():
	## Connect the meta_clicked signal to a function in THIS script
	#meta_clicked.connect(_on_option_selected)
	##on_option()
#
#func on_option():
	#text = ""  # Clear previous text
	#for i in range(1, 5):
		#text += "[url=option_%d]%d. %s[/url]\n" % [i, i, "Option"]
	#return
#
#func _on_option_selected(meta):
	## This gets called when an option is clicked
	#print("Selected: ", meta)
	#
	## Parse which option was selected
	#if meta.begins_with("option_"):
		#var option_number = int(meta.split("_")[1])
		#print("Player chose option ", option_number)
		#
		## Here you would tell Dialogic which option was chosen
		## Dialogic.handle_choice(option_number - 1)  # If using Dialogic's choice system
	

func _ready():
	# Wait to ensure parent node is fully ready
	await get_tree().process_frame
	
	# Connect the meta clicked signal
	meta_clicked.connect(_on_option_clicked)
	
	# Show default options
	on_option()

func on_option():
	text = ""  # Clear previous choices
	for i in range(1, 5):
		text += "[url=option_%d]%d. %s[/url]\n" % [i, i, "Option"]

func _on_option_clicked(meta):
	# Get reference to the dialogue node
	var dialogue_node = get_node_or_null("../Panel/vb/dialogue")
	
	# Check if dialogue node exists
	if dialogue_node == null:
		print("Error: Cannot find dialogue node at ../Panel/vb/dialogue")
		return
	
	# Parse which option was clicked
	if meta is String and meta.begins_with("option_"):
		var option_number = meta.split("_")[1]
		
		# Add the chosen option to the dialogue log
		dialogue_node.add_t("> Option " + option_number + " was chosen")
		
		# Optional: Clear choices after selection
		text = ""
		
		# Optional: Disable further clicks
		meta_clicked.disconnect(_on_option_clicked)
