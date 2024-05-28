extends Node
var postit: Dictionary
@onready var dialog = $Control/MarginContainer/MarginContainer/VBoxContainer/Dialog

func _ready():
	create_dictionary()
	print(postit)
	read_dialog()
	read_option()
func load_text():
	var file = FileAccess.open("res://dialog/final.txt", FileAccess.READ)
	var content = file.get_as_text()
	return content
	
func create_dictionary():
	var content: String = load_text()
	var current_keyword: String
	for line: String in content.split("\n"):
		if line.begins_with("%"):
			var clean_line = line.replace("%","")
			postit[clean_line] = {"dialog":"", "option":[],"image":""}
			current_keyword = clean_line
		else:
			if not current_keyword.is_empty():
				if line.begins_with("[["):
					var option: String = line.replace("[[","").replace("]]","")
					postit[current_keyword]["option"].append(option)
				else:
					postit[current_keyword]["dialog"] = postit[current_keyword]["dialog"] + line + "[p]"
				
func read_dialog():
	var richtext = dialog.get_node("Text") as RichTextLabel
	var first_dialog = postit.values()[0]
	richtext.text = first_dialog["dialog"]
	
func read_option():
	var option_list = dialog.get_node("Options") as OptionList
	var first_dialog = postit.values()[0]
	for option: String in first_dialog["option"]:
		option_list.add_option(option)
	
	

