extends Node

signal load_level_1


# Called when the node enters the scene tree for the first time.
func _ready():
	# connect the signal to the game node or some shit
	connect("main_menu_button_signal", get_parent().load_map)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass 

func level_button_1(path):
	load_level_1.emit(path)
