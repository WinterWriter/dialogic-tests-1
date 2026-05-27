
#func _ready():
	## Connect to Dialogic timeline events
	#Dialogic.timeline_ended.connect(_on_timeline_ended)
	#
	## Start hidden
	#visible = false
#
## Call this from your game to start dialogue
#func start_dialogue(timeline_name: String):
	#visible = true
	#dialogue_log.text = ""  # Clear previous dialogue
	#Dialogic.Layouts.load_layout("CustVizNov")
	#Dialogic.start(timeline_name)
	##Dialogic.start(timeline_name)
#
#func _on_timeline_ended():
	## Clear choices when dialogue ends
	#if choice_container:
		#choice_container.clear_choices()
	#visible = false
	
extends Control

@onready var dialogue_log: RichTextLabel = $"../Custome Scrolling Dialogue2/vb/dialogue"
@onready var choice_container: VBoxContainer = $"../Custome Scrolling Dialogue2/vb/ChoiceContainer"



func _ready():
	# Connect to Dialogic timeline events
	Dialogic.timeline_started.connect(_on_timeline_started)
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	
	# Start hidden
	visible = false

# Call this function from your game to start dialogue
func start_dialogue(timeline_name: String):
	visible = true
	if dialogue_log:
		dialogue_log.text = ""  # Clear previous dialogue
	
	# Load your custom layout (create this in Dialogic editor)
	Dialogic.Layouts.load_layout("CustVizNov")
	
	# Start the timeline
	Dialogic.start(timeline_name)

func _on_timeline_started():
	visible = true

func _on_timeline_ended():
	visible = false
