extends Button
class_name OptionButtom
signal option_pressed(option)
func _on_pressed():
	emit_signal("option_pressed",text)
