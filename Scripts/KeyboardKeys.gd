extends RichTextLabel

var baseString = "Keyboard Buttons Pressed: "
var buttonList = []

func _ready():
	text = baseString + "NONE"

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			buttonList.append(event.as_text() + " ")
		else:
			buttonList.erase(event.as_text() + " ")
		update_text();

func update_text():
	text = baseString
	if (buttonList.empty()):
		text = text + "NONE"
		return
		
	for button in buttonList:
		text = text + button
