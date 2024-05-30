extends VFlowContainer
class_name OptionList
signal option_pressed(option)
var buttom_scene: PackedScene = preload("res://scene/ui/option_buttom.tscn")
func add_option(option: String):
	var button_instance = buttom_scene.instantiate() as OptionButtom
	button_instance.text = option
	button_instance.option_pressed.connect(on_option_pressed)
	add_child(button_instance)
	
#Clean buttoms
func clean_options():
	for child in get_children():
		child.queue_free()
		
func on_option_pressed(option):
	emit_signal("option_pressed",option)
	
