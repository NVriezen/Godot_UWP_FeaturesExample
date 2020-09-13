extends RichTextLabel

var baseString = "Mouse/Pen Position: "
var speedString = "Speed: "
var speed = 0;
var position : Vector2;

func _ready():
	text = baseString

func _input(event):
	if event is InputEventMouse:
		if event is InputEventMouseMotion:
			update_motion(event)
		else:
			update_position(event)
		update_text()

func update_text():
	text = baseString + str(position) + " " + speedString + str(speed)

func update_motion(event : InputEventMouseMotion):
	position += event.relative
	if (event.speed.length() == 0):
		return
	speed = event.speed

func update_position(event : InputEventMouse):
	position = event.global_position
