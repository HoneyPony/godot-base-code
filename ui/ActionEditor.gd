extends Label

export var action: String

onready var label = $CurrentKey

var editing = false

func update_label_text(event: InputEvent):
	if event is InputEventKey:
		var repr = OS.get_scancode_string(event.get_scancode_with_modifiers()) 
		if repr == "":
			repr = OS.get_scancode_string(event.get_physical_scancode_with_modifiers()) 
		label.text = repr

# Called when the node enters the scene tree for the first time.
func _ready():
	var existing = InputMap.get_action_list(action)
	if existing.size() > 0:
		update_label_text(existing[0])
		
func automatic():
	# Use Godot's built-in capitalization.
	text = action.capitalize()

func _input(event):
	if not editing:
		return
		
	if event is InputEventKey and event.is_pressed():
		InputMap.action_erase_events(action)
		InputMap.action_add_event(action, event)
		editing = false
		
		update_label_text(event)

func _on_EditButton_pressed():
	editing = true
	label.text = "..."
