extends RichTextLabel

var baseString = "Gamepad Buttons Pressed: "
var buttonList = []

func _ready():
	text = baseString + "NONE"

func _input(event):
	if event is InputEventJoypadButton:
		if event.pressed:
			buttonList.append(str(event.button_index) + " ")
		else:
			buttonList.erase(str(event.button_index) + " ")
		update_text();

func update_text():
	text = baseString
	if (buttonList.empty()):
		text = text + "NONE"
		return
		
	for button in buttonList:
		text = text + button
