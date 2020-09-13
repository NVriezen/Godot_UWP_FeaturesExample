extends RichTextLabel

var baseString = "Mouse Buttons Pressed: "
var buttonList = []

func _ready():
	text = baseString + "NONE"

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			buttonList.append(get_button_string(event.button_index) + " ")
		else:
			buttonList.erase(get_button_string(event.button_index) + " ")
		update_text();

func update_text():
	text = baseString
	if (buttonList.empty()):
		text = text + "NONE"
		return
		
	for button in buttonList:
		text = text + button

func get_button_string(button_index : int):
	match button_index:
		BUTTON_LEFT:  return "BUTTON_LEFT"
		BUTTON_RIGHT: return "BUTTON_RIGHT"
		BUTTON_MIDDLE: return "BUTTON_MIDDLE"
		BUTTON_XBUTTON1: return "BUTTON_XBUTTON1"
		BUTTON_XBUTTON2: return "BUTTON_XBUTTON2"
		BUTTON_WHEEL_UP: return "BUTTON_WHEEL_UP"
		BUTTON_WHEEL_DOWN: return "BUTTON_WHEEL_DOWN"
		BUTTON_WHEEL_LEFT: return "BUTTON_WHEEL_LEFT"
		_: return "UNKNOWN_BUTTON"
