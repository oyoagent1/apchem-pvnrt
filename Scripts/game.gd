extends Node

# Variables for loaded scenes
var active_menu
var active_map
var active_player

var pause_menu_open: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pause_menu_open = false
	load_player("res://Scenes/Player/menu_player.tscn")
	load_menu("res://Scenes/pause_menu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("pause_game"):
		print(pause_menu_open)
		if pause_menu_open:
			load_menu("clear")
			pause_menu_open = !pause_menu_open
			return
		else:
			load_menu("res://Scenes/pause_menu.tscn")
			pause_menu_open = !pause_menu_open

# Methods to load shit, call with "clear" to make the active menu hit the griddy(go away)
func load_menu(path: String):
	if path == "clear":
		active_menu.queue_free()
		return
	else:
		if active_menu != null:
			active_menu.queue_free()
		var menu = load(path)
		menu = menu.instantiate()
		add_child(menu)
		active_menu = menu
		print(menu)
		pause_menu_open = false

func load_player(path: String):
	if path == "clear":
		active_menu.queue_free()
		return
	else:
		if active_player != null:
			active_player.queue_free()
		var player = load(path)
		player = player.instantiate()
		add_child(player)
		active_player = player
		print(player)

func load_map(path: String):
	if path == "clear":
		active_menu.queue_free()
		return
	else:
		if active_map != null:
			active_map.queue_free()
		var map = load(path)
		map = map.instantiate()
		add_child(map)
		active_map = map
		print(map)

