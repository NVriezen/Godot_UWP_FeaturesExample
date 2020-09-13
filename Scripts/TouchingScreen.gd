extends RichTextLabel

var baseString = "Are You Touching The Screen?: "
var buttonList = []

func _ready():
	text = baseString + "NO"

func _input(event):
	if event is InputEventScreenTouch:
		update_text_touch(event)
	if event is InputEventScreenDrag:
		update_text_drag(event)

func update_text_touch(event : InputEventScreenTouch):
	text = baseString
	if (event.pressed):
		text = text + "NO"
		return
		
	text = text + "YES Position: " + str(event.position)

func update_text_drag(event : InputEventScreenDrag):
	text = baseString
	if (event.speed.length() == 0):
		return
		
	text = text + "YES Position: " + str(event.position) + " Speed: " + str(event.speed)
