extends VFlowContainer
class_name OptionList
var buttom_scene: PackedScene = preload("res://scene/ui/option_container.tscn")
func add_option(option: String):
	var button_instance = buttom_scene.instantiate()
	add_child(button_instance)
	button_instance.text = option
