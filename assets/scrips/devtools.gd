@tool
extends EditorScript


# Called when the script is executed (using File -> Run in Script Editor).
func _run():
	clean_dialog()
	pass
	
func clean_dialog():
	var xml_parser: XMLParser = XMLParser.new()
	var dialog = FileAccess.open("C:/Users/alejandro/Desktop/Cabinet.html", FileAccess.READ)
	var cleaned = FileAccess.open("res://dialog/final.txt", FileAccess.WRITE)
	
	xml_parser.open_buffer(dialog.get_buffer(dialog.get_length()))
	
	var is_started = false
	
	while xml_parser.read() == OK:
		var tag = ""
		tag = xml_parser.get_named_attribute_value("name")
		if xml_parser.get_node_name() == "tw-passagedata":
			if xml_parser.get_node_type() == XMLParser.NODE_ELEMENT:
				
				is_started = true
			else:
				is_started = false
		if is_started and xml_parser.get_node_type() == XMLParser.NODE_TEXT:
			#print(xml_parser.get_node_data())
			cleaned.store_line("%"+tag)
			cleaned.store_line(xml_parser.get_node_data())
			
	cleaned.close()
