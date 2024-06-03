extends Node

@onready var dialog = $Control/MarginContainer/MarginContainer/VBoxContainer/Dialog
@onready var richtext = dialog.get_node("Text") as RichTextLabel
@onready var option_list = dialog.get_node("Options") as OptionList
func _ready():
	Global.dialog_dictionary =create_dictionary()
	read_next_dialog("Hab Andrea irreal #1")
	option_list.option_pressed.connect(on_option_pressed)
func load_text():
	var file = FileAccess.open("res://dialog/final.txt", FileAccess.READ)
	var content = file.get_as_text()
	return content
func create_dictionary()-> Dictionary:
	var postit: Dictionary
	var content: String = load_text()
	var current_keyword: String
	for line: String in content.split("\n"):
		if line.begins_with("%"):
			var clean_line = line.replace("%","")
			postit[clean_line] = {"dialog":"", "option":[],"BG":"", "CH":""}
			current_keyword = clean_line
		else:
			if not current_keyword.is_empty():
				if line.begins_with("[["):
					var option: String = line.replace("[[","").replace("]]","")
					postit[current_keyword]["option"].append(option)
				else:
					postit[current_keyword]["dialog"] = postit[current_keyword]["dialog"] + line + "[p]"
	return postit
				
func read_next_dialog(option: String):
	option_list.clean_options()
	#Read dialog
	var current_dialog = Global.dialog_dictionary[option]
	richtext.text = current_dialog["dialog"]
	#Adding buttoms
	for op: String in current_dialog["option"]:
		option_list.add_option(op)
	
func manage_dialog():
	var first_dialog = Global.dialog_dictionary.values()[0]
	
func on_option_pressed(option):
	read_next_dialog(option)

