extends Node

signal main_menu_button_signal(path: String)
# Called when the node enters the scene tree for the first time.
func _ready():
	#connect signal to assumed parent game node
	connect("main_menu_button_signal", get_parent().load_menu)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func main_menu_button():
	main_menu_button_signal.emit("res://Scenes/main_menu.tscn")