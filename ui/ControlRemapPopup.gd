extends Popup

onready var action_editor_list = $Panel/ActionEditorList

var ActionEditor = preload("res://ui/ActionEditor.tscn")

# If the Popup is set to Automatic, it will automatically populate the VBoxContainer
# with all actions that don't start with ui_.
#
# If automatic is disabled, you can manually add ActionEditors to the container.
export var automatic = true

func _ready():
	for action in InputMap.get_actions():
		if action.begins_with("ui_"):
			continue
			
		var editor = ActionEditor.instance()
		editor.action = action
		action_editor_list.add_child(editor)
		editor.automatic()
