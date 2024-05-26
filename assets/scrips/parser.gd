extends Node
var xml_parser: XMLParser = XMLParser.new()
func _ready():
	var dialog = FileAccess.open("res://dialog/cabinet.txt", FileAccess.READ)
	xml_parser.open_buffer(dialog.get_buffer(dialog.get_length()))
	
	var is_started = false
	
	while xml_parser.read() == OK:
		if xml_parser.get_node_name() == "tw-passagedata":
			if xml_parser.get_node_type() == XMLParser.NODE_ELEMENT:
				is_started = true
			else:
				is_started = false
		if is_started and xml_parser.get_node_type() == XMLParser.NODE_TEXT:
			print(xml_parser.get_node_data())
